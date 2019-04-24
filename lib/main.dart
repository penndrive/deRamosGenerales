import 'package:deramosgenerales/BLoC/BLoC_Lista/BlocLista.dart';
import 'package:deramosgenerales/BLoC/BLoC_Lista/EstadoLista.dart';
import 'package:flutter/material.dart';
import 'package:deramosgenerales/Widgets/listaSTL.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deramosgenerales/BLoC/BLoC_Login/LoginBloc.dart';
import 'package:deramosgenerales/BLoC/BLoC_Login/AuthState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _listaBloc = ListaBloc();
  final _loginBloc = LoginBloc();
  
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<ListaBloc>(
            bloc: _listaBloc,
          ),
          BlocProvider<LoginBloc>(
            bloc: _loginBloc,
          )
        ],
        child: MaterialApp(
            title: "deRamosGenerales",
            theme: ThemeData(primarySwatch: Colors.green),
            home: MyHomePage()));
  
  }
  
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, AuthState authstate) {
          return Scaffold(
              appBar: AppBar(
                actions: <Widget>[IconButton(
                  onPressed: null,// TODO: Redireccionar a Carrito().
                  icon: Icon(Icons.shopping_basket,
                  ),
                )],
                title: Text('deRamosGenerales'),
                
              ),
              body: BlocBuilder(
                  bloc: BlocProvider.of<LoginBloc>(context),
                  builder: (context, AuthState state) {
                    if (state.user == null) {
                      return Column(
                        children: <Widget>[
                          Text('${state.status}'),
                          RawMaterialButton(
                            onPressed: () =>
                                BlocProvider.of<LoginBloc>(context).signin(),
                            child: Text('SignIn'),
                          ),
                        
                        ],
                      );
                    } else if (state.user!=null) {
                      return Lista();
                    }
                  }),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add),
                        BlocBuilder(
                            bloc: BlocProvider.of<ListaBloc>(context),
                            builder: (context, EstadoLista state) {
                              return Text('${state.cantidad}');
                            })
                      ],
                    ),
                    onPressed: () =>
                        BlocProvider.of<ListaBloc>(context).agregarComida(1, 3),
                  ),
                  
                  
                  //TODO:Hacer desaparecer los botones
                  
                  
                  
                  
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<LoginBloc>(context).signOut(),
                        //BlocProvider.of<ListaBloc>(context).quitarComida(1, 3),
                    child: Stack(
                      children: <Widget>[
                        new Icon(Icons.add_shopping_cart),
                        new Positioned(
                          right: 0,
                          bottom: 0,
                          child: new Container(
                            padding: EdgeInsets.all(1),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: new Text(
                              '12',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                  /* child: Icon(Icons.remove),
            onPressed: () => BlocProvider.of<ListaBloc>(context).quitarComida(),
          ), */
                ],
              ));
        });
  }

  @override
  void dispose() {
    //_listaBloc.dispose();
    super.dispose();
  }
}
