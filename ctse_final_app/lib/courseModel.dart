class CourseModel {
  String title;
  String name;
  String description;

  CourseModel(
      {this.title,this.name,
      this.description,
      });
}

class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        title:"Week 01",
        name: "Machine Learning",
        description:
            "Its is about Machine Learing",
       ),
    CourseModel(
        title:"Week 02",
        name: "Introduction of Flutter",
        description:"Flutter"
        ),
    CourseModel(
        title:"Week 03",
        name: "Flutter Widgets",
        description: "Flutter",
    ),

    CourseModel(
      title:"Week 04",
      name: "Micro Services",
      description: "Its is Microservices",
    ),
    CourseModel(
        title:"Week 05",
        name: "Docker",
        description: "Docker"
    ),

  ];
}
