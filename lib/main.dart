import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/ui/pages/main.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

var _uri = 'http://178.128.254.188/api';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key key}) : super (key: key);

  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      uri: _uri
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httpLink,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              backgroundColor: CustomTheme.getTheme.backgroundColor,
              body: MainPage()
            ),
          ),
        ),
      ),
    );
  }
}
