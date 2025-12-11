import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

/// CustomScrollView: 여러 Sliver 위젯을 하나의 스크롤 영역에서 조합
class CustomScrollViewScreen extends StatelessWidget {
  // 테스트용 숫자 리스트 (0~99)
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // 여러 Sliver 위젯들을 순서대로 배치
        slivers: [
          // 스크롤 가능한 AppBar
          renderSliverAppbar(),
          renderBuilderSliverList(),
          renderSliverGridBuilder(),
          renderSliverGridBuilder(),
        ],
      ),
    );
  }

  // AppBar
  SliverAppBar renderSliverAppbar(){
    return SliverAppBar(
      // 스크롤 했을때 리스트의 중간에도 Appbar가 내려오게 할 수 있음.
      floating: true,
      //완전 고정
      pinned: false,
      // 자석 효과
      // floating true 에만 사용가능
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을때
      // 남는 공간을 차지
      stretch: true,
      // 최대사이즈
      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'asset/img/image_1.jpeg',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
      title: Text('CustomScrollViewScreen'),
      centerTitle: true,
    );
  }

  // ListView 기본 생성자와 유사: 모든 위젯을 미리 생성
  // 적은 수의 아이템에 적합
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // ListView.builder와 유사: 지연 렌더링 (Lazy Loading)
  // 화면에 보이는 아이템만 생성하여 메모리 효율적
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100, // 총 아이템 개수
      ),
    );
  }

  // GridView.count 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // GridView.builder 와 비슷함
  SliverGrid renderSliverGridBuilder(){
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  // 컨테이너 위젯 생성 헬퍼 메서드
  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    //print(index); // 디버깅용: 지연 렌더링 확인
    return Container(
      height: height ?? 300, // 기본값 300
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
