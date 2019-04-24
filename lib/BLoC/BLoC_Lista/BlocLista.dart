import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:deramosgenerales/BLoC/BLoC_Lista/EstadoLista.dart';
import 'package:deramosgenerales/BLoC/BLoC_Lista/EventosLista.dart';

class ListaBloc extends Bloc<ListaEvent, EstadoLista> {
 int price,qty;

agregarComida(int precio, int cantidad){
  price=precio;
  qty=cantidad;
dispatch(AgregarComida());
}
quitarComida(int precio, int cantidad){
  price=precio;
  qty=cantidad;
  dispatch(QuitarComida());
}


  @override
 
  EstadoLista get initialState => EstadoLista.initial();

  @override
  Stream<EstadoLista> mapEventToState(ListaEvent event) async*{
  

    if (event is AgregarComida) {
      yield EstadoLista(total:currentState.total+price,cantidad:currentState.cantidad+qty);
    } else if (event is QuitarComida) {
      yield EstadoLista(total:currentState.total-price,cantidad: currentState.cantidad-qty);
    }
  }

  
}
