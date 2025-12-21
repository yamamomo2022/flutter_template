import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/router_config.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
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
          onTap:
              () => GoRouter.of(
                context,
              ).push('/${catalogRoutes[index].title.toLowerCase()}'),
          child: Card(
            elevation: 4,
            child: Center(child: Text(catalogRoutes[index].title)),
          ),
        );
      }),
    );
  }
}
