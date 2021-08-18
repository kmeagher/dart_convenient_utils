
class MyClass {

  String? id;
  String? name;
  String? description;

  MyClass({
    this.id,
    this.name,
    this.description
  });

  factory MyClass.fromJson(dynamic data) {
    if (data==null) data = {};
    return new MyClass(
      id: data["id"],
      name: data["name"],
      description: data["description"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description
    };
  }

}