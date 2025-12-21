import 'package:flutter/material.dart';
import 'package:flutter_template/pages/my_home_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: const _CatalogGrid(),
    );
  }
}

class _CatalogGrid extends StatelessWidget {
  const _CatalogGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: List.generate(catalogRoutes.length, (index) {
        return InkWell(
          onTap: () {},
          child: Card(
            elevation: 4,
            child: Center(
              child: Text(catalogRoutes[index].title),
            ),
          ),
        );
      }),
    );
  }
}

List<CatalogRoute> catalogRoutes =  <CatalogRoute>[
  CatalogRoute(
    title: 'Top',
    page: const MyHomePage(),
  ),
  CatalogRoute(
    title: 'Catalog',
    page: const CatalogPage(),
  ),
];


/// カタログページのルート情報を管理するクラス。
/// go_routerのルート定義で利用することを想定。
class CatalogRoute {
  /// ルートのタイトル
  final String title;
  /// 表示するページウィジェット
  final Widget page;

  /// [title]はルートのタイトル、[page]は表示するウィジェット。
  const CatalogRoute({
    required this.title,
    required this.page,
  });
}
