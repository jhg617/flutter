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
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video != null
          ? _VideoPlayer(
            video: video!,
          )
          : _VideoSelect(
            onLogoTap: onLogoTap,
            ),
    );
  }

  onLogoTap() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

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

  const _VideoPlayer({
    required this.video,
    super.key,
  });

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late final VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();

    initializeController();
  }

  initializeController() async {
    videoPlayerController = VideoPlayerController.file(
      File(
        widget.video.path
      ),
    );

    await videoPlayerController.initialize();

    // Controller에 Listener 추가: 재생/정지 상태 변경 시 UI 자동 업데이트
    // play() 또는 pause() 호출 시 Controller 상태가 변경되고, 
    // 이 Listener가 자동으로 트리거되어 setState()를 호출하여 UI를 갱신합니다.
    videoPlayerController.addListener(() {
      setState(() {});
    });

    // Controller 초기화 완료 후 첫 번째 UI 렌더링을 위해 setState 호출
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        // Stack 위젯: 여러 위젯을 겹쳐서 배치할 수 있게 해주는 위젯
        // 첫 번째 자식이 가장 아래 레이어, 마지막 자식이 가장 위 레이어
        child: Stack(
          children: [
            // 1. 가장 아래 레이어: 실제 비디오 플레이어
            // Stack의 첫 번째 자식이므로 배경으로 표시됨
            VideoPlayer(
              videoPlayerController,
            ),
            
            // 2. 중앙 레이어: 영상 중앙에 컨트롤 아이콘들 배치
            // Align 위젯으로 정확한 위치 지정 (중앙 정렬)
            Align(
              alignment: Alignment.center,
              // Row로 여러 아이콘 버튼을 가로로 나열
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 뒤로 돌리기 (3초 뒤로 이동)
                  IconButton(
                    color: Colors.white,
                    onPressed: (){
                      final currentPosition = videoPlayerController.value.position;

                      // 기본값: 시작 위치(0초)
                      Duration position = Duration();

                      // 현재 위치가 3초보다 크면 3초 뒤로 이동
                      if(currentPosition.inSeconds > 3) {
                        position = currentPosition - Duration(seconds: 3);
                      }

                      // 계산된 위치로 재생 위치 이동
                      videoPlayerController.seekTo(position);
                    },
                    icon: Icon(Icons.rotate_left),
                  ),
                  // 재생/정지 토글 버튼: Listener와 연동되어 아이콘 자동 업데이트
                  IconButton(
                    color: Colors.white,
                    onPressed: (){
                      // 재생 상태에 따라 play/pause 토글
                      // Controller 상태 변경 시 위의 Listener가 자동으로 UI 업데이트
                      setState(() {
                        if (videoPlayerController.value.isPlaying) {
                          videoPlayerController.pause();
                        } else {
                          videoPlayerController.play();
                        }
                      });
                    },
                    // 재생 상태에 따라 아이콘 동적 변경
                    icon: Icon(
                      videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    ),
                  ),
                  // 앞으로 돌리기 (3초 앞으로 이동)
                  IconButton(
                    color: Colors.white,
                    onPressed: (){
                      final maxPosition = videoPlayerController.value.duration;
                      final currentPosition = videoPlayerController.value.position;

                      // 기본값: 끝 위치
                      Duration position = maxPosition;

                      // 끝에서 3초 전 위치보다 현재가 앞에 있으면 3초 앞으로 이동
                      if((maxPosition - Duration(seconds: 3)).inSeconds >
                          currentPosition.inSeconds) {
                        position = currentPosition + Duration(seconds: 3);
                      }

                      // 계산된 위치로 재생 위치 이동
                      videoPlayerController.seekTo(position);
                    },
                    icon: Icon(Icons.rotate_right),
                  ),
                ],
              ),
            ),
            
            // 3. 하단 레이어: 영상 하단에 재생 진행 바 배치
            // Positioned 위젯으로 정확한 위치 지정 (하단 전체 너비)
            Positioned(
              bottom: 0,  // 하단에서 0 픽셀 떨어진 위치
              left: 0,    // 왼쪽 끝에서 시작
              right: 0,   // 오른쪽 끝까지 확장
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    Text(
                      '${videoPlayerController
                          .value
                          .position
                          .inMinutes
                        .toString()
                          .padLeft(2, '0')}:${(videoPlayerController
                        .value
                        .position
                        .inSeconds % 60).toString()
                        .padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: 
                          videoPlayerController.value.position.inSeconds.toDouble(),
                        max: 
                          videoPlayerController.value.duration.inSeconds.toDouble(),
                        onChanged: (double val){},
                      ),
                    ),
                    Text(
                      '${videoPlayerController
                          .value
                          .duration
                          .inMinutes
                          .toString()
                          .padLeft(2, '0')}:${(videoPlayerController
                        .value
                        .duration
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
            ),
            
            // 4. 우측 상단 레이어: 우측 상단에 카메라 아이콘 배치
            // Positioned 위젯으로 우측 상단 모서리에 고정
            Positioned(
              right: 0,  // 오른쪽에서 0 픽셀 떨어진 위치 (기본적으로 top: 0)
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.photo_camera_back,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
