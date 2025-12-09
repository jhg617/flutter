import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 선택된 비디오 파일을 저장하는 상태 변수
  // null이면 비디오 선택 화면, 값이 있으면 비디오 플레이어 화면 표시
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 비디오 선택 여부에 따라 다른 화면 표시 (조건부 렌더링)
      body: video != null
          ? _VideoPlayer(
            video: video!,
            onAnotherVideoPicked: onLogoTap,
          )
          : _VideoSelect(
            onLogoTap: onLogoTap,
            ),
    );
  }

  // 갤러리에서 비디오를 선택하는 함수
  onLogoTap() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    // 선택된 비디오를 상태에 저장하여 플레이어 화면으로 전환
    setState(() {
      this.video = video;
    });
  }
}

class _VideoSelect extends StatelessWidget {
  final VoidCallback onLogoTap;

  const _VideoSelect({
    required this.onLogoTap,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2A3A7C), Color(0xFF000118)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(onTap: onLogoTap),
          SizedBox(height: 28.0),
          _Title(),
        ],
      ),
    );
  }
}
class _Logo extends StatelessWidget {
  final VoidCallback onTap;

  const _Logo({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset('asset/image/logo.png'),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('VIDEO', style: textStyle),
        Text('PLAYER', style: textStyle.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onAnotherVideoPicked;

  const _VideoPlayer({
    required this.video,
    required this.onAnotherVideoPicked,
    super.key,
  });

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  // 비디오 재생을 제어하는 컨트롤러
  late VideoPlayerController videoPlayerController;
  bool showIcons = true;

  @override
  void dispose() {
    // 위젯이 제거될 때 컨트롤러를 해제하여 메모리 누수 방지
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 위젯이 생성될 때 비디오 컨트롤러 초기화
    initializeController();
  }

  @override
  didUpdateWidget(covariant _VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 다른 비디오가 선택되면 새로운 컨트롤러로 재초기화
    if(oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  // 비디오 컨트롤러를 초기화하는 비동기 함수
  initializeController() async {
    // 파일 경로를 사용하여 비디오 컨트롤러 생성
    videoPlayerController = VideoPlayerController.file(
      File(
        widget.video.path
      ),
    );

    // 비디오 초기화 완료 대기 (메타데이터 로드 등)
    await videoPlayerController.initialize();

    // 재생/정지 상태 변경 시 UI 자동 업데이트
    // 컨트롤러의 상태가 변경될 때마다 setState 호출하여 UI 갱신
    videoPlayerController.addListener(() {
      setState(() {});
    });

    // 초기화 완료 후 UI 업데이트
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showIcons = !showIcons;
        });
      },
      child: Center(
        child: AspectRatio(
          // 비디오의 원본 비율을 유지하여 왜곡 방지
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Stack(
            // Stack을 사용하여 비디오 위에 컨트롤 UI 오버레이
            children: [
              // 실제 비디오를 재생하는 위젯
              VideoPlayer(
                videoPlayerController,
              ),
              if(showIcons)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.5),
              ),
              // 재생/정지, 빨리감기, 되감기 버튼
              if(showIcons)
              _PlayButton(
                onForwardPressed: onForwardPressed,
                onPlayPressed: onPlayPressed,
                onReversePressed: onReversePressed,
                isPlaying: videoPlayerController.value.isPlaying,
              ),
              // 하단 진행 바 및 시간 표시
              if(showIcons)
              _Bottom(
                position: videoPlayerController.value.position,
                maxPosition: videoPlayerController.value.duration,
                onSliderChanged: onSliderChanged,
                ),
              // 다른 비디오 선택 버튼
              if(showIcons)
              _PickAnotherVideo(
                onPressed: widget.onAnotherVideoPicked,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  onSliderChanged(double val) {
    final position = Duration(seconds: val.toInt());
    videoPlayerController.seekTo(position);
  }

  // 3초 앞으로 이동 (빨리감기)
  onForwardPressed(){
    final maxPosition = videoPlayerController.value.duration;
    final currentPosition = videoPlayerController.value.position;

    Duration position = maxPosition;

    // 끝에서 3초 이내가 아니면 3초 앞으로 이동, 아니면 끝으로 이동
    if((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    videoPlayerController.seekTo(position);
  }

  // 재생/정지 토글
  onPlayPressed(){
    setState(() {
      if (videoPlayerController.value.isPlaying) {
        videoPlayerController.pause();
      } else {
        videoPlayerController.play();
      }
    });
  }

  // 3초 뒤로 이동 (되감기)
  onReversePressed(){
    final currentPosition = videoPlayerController.value.position;

    Duration position = Duration();

    // 현재 위치가 3초 이상이면 3초 뒤로 이동, 아니면 처음으로 이동
    if(currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }

    videoPlayerController.seekTo(position);
  }
}

class _PlayButton extends StatelessWidget {
  final VoidCallback onReversePressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _PlayButton({
    required this.onForwardPressed,
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.isPlaying,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: onReversePressed,
            icon: Icon(Icons.rotate_left),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onPlayPressed,
            icon: Icon(
              isPlaying
                ? Icons.pause
                : Icons.play_arrow,
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onForwardPressed,
            icon: Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final Duration position;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged;

  const _Bottom({
    required this.position,
    required this.maxPosition,
    required this.onSliderChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            // 현재 재생 위치 (MM:SS 형식)
            Text(
              '${position.inMinutes.toString()
                  .padLeft(2, '0')}:${(position
                  .inSeconds % 60).toString()
                .padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // 비디오 진행 상태를 표시하는 슬라이더
            // 현재는 읽기 전용 (onChanged가 비어있음)
            Expanded(
              child: Slider(
                value: 
                  position.inSeconds.toDouble(),
                max: 
                  maxPosition.inSeconds.toDouble(),
                onChanged: onSliderChanged,
              ),
            ),
            // 영상 전체 길이 (MM:SS 형식)
            Text(
              '${maxPosition
                  .inMinutes
                  .toString()
                  .padLeft(2, '0')}:${(maxPosition
                .inSeconds % 60)
                .toString()
                .padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickAnotherVideo extends StatelessWidget {
  final VoidCallback onPressed;

  const _PickAnotherVideo({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        color: Colors.white,
        onPressed: onPressed,
        icon: Icon(
          Icons.photo_camera_back,
        ),
      ),
    );
  }
}