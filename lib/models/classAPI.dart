class Attributes {
  // final int id;
  final String categories;
  final String forces;
  final String muscles;

  const Attributes({
   required this.categories, required this.forces, required this.muscles,
});

  factory Attributes.fromJson(Map<String, dynamic> json){
    return Attributes(
        categories: json['categories'],
        forces: json['forces'],
        muscles: json['muscles']
    );}
}