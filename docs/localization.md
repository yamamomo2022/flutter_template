## HOWTO
- **@@local** は、公式にはないが必要である。
- pub get で自動生成されるが、推奨なのか？
- onGenerateTitle: (context) => AppLocalizations.of(context)!.title, でないと、初期段階では、context を取得できていないので、nullになる。



## Reference
- https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization