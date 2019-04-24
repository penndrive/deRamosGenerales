class EstadoLista {
 final int cantidad, total;
final List<int> lista;
const EstadoLista({this.total,this.cantidad,this.lista});
  

factory EstadoLista.initial() =>EstadoLista(total:0,cantidad: 0);
  
}
