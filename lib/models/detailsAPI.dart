class Details{
  final List<dynamic> id;

  const Details({
    required this.id
  });

  factory Details.fromJson(List<dynamic> json){
    return Details(
        id: json,
    );}
}