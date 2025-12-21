import 'package:go_router/go_router.dart';
import 'package:flutter_template/pages/catalog_page.dart';
import 'package:flutter_template/pages/my_home_page.dart';
import 'package:flutter/material.dart';

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

// カタログ用のルートリスト
final List<CatalogRoute> catalogRoutes = <CatalogRoute>[
  CatalogRoute(
    title: 'Top',
    page: const MyHomePage(),
  ),
  CatalogRoute(
    title: 'Catalog',
    page: const CatalogPage(),
  ),
];

// GoRouterのセットアップ
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CatalogPage(),
      routes: [
        for (final route in catalogRoutes)
          GoRoute(
            path: route.title.toLowerCase(),
            builder: (_, _) => route.page,
          ),
      ],
    ),
  ],
);

