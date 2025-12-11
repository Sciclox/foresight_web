

int? suma1(int? numero) {
  // dame el numero mas 1
  return (numero ?? 0) + 1;
}

int? restar1(int? numero) {
  if (numero == null) return null;

  final resultado = numero - 1;

  return resultado < 0 ? 0 : resultado;
}
