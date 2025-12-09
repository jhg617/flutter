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
                  // 왼쪽 회전 아이콘 (반시계 방향)
                  IconButton(
                    color: Colors.white,
                    onPressed: (){},
                    icon: Icon(Icons.rotate_left),
                  ),
                  // 중앙 재생/일시정지 아이콘
                  // 재생 상태에 따라 아이콘과 기능이 동적으로 변경되는 토글 버튼
                  IconButton(
                    color: Colors.white,
                    // 버튼 클릭 시 실행되는 콜백 함수
                    onPressed: (){
                      // setState를 호출하여 UI를 다시 그리도록 함
                      // 비디오 재생 상태가 변경되면 아이콘도 함께 업데이트되어야 하기 때문
                      setState(() {
                        // videoPlayerController.value.isPlaying: 현재 비디오가 재생 중인지 확인
                        if (videoPlayerController.value.isPlaying) {
                          // 재생 중이면 → 일시정지로 전환
                          videoPlayerController.pause();
                        } else {
                          // 일시정지 상태면 → 재생으로 전환
                          videoPlayerController.play();
                        }
                      });
                    },
                    // 아이콘을 재생 상태에 따라 동적으로 변경
                    // 삼항 연산자를 사용하여 조건부 렌더링
                    icon: Icon(
                      // 재생 중이면 일시정지 아이콘(pause) 표시
                      // 일시정지 상태면 재생 아이콘(play_arrow) 표시
                      videoPlayerController.value.isPlaying
                        ? Icons.pause      // 재생 중일 때: 일시정지 아이콘
                        : Icons.play_arrow, // 일시정지일 때: 재생 아이콘
                    ),
                  ),
                  // 오른쪽 회전 아이콘 (시계 방향)
                  IconButton(
                    onPressed: (){},
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
              child: Slider(
                value: 0,
                onChanged: (double val){},
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
