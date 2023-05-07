class ProjectModel {
  const ProjectModel._({
    required this.title,
    required this.description,
    required this.designer,
    required this.pathImage,
    required this.route,
  });

  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String route;

  static const expenseTracker = ProjectModel._(
    title: 'Express Tracker',
    description: 'Flutter UI Fundamentals + Themes',
    designer: 'Mao Lop',
    pathImage: 'assets/img/projects/expenseTracker.png',
    route: 'expenseTracker',
  );

  static const weatherInshort = ProjectModel._(
    title: 'Weather Detail',
    description: 'Getting weather Details with REST Api',
    designer: 'Angel Yu',
    pathImage: 'assets/img/projects/weather.png',
    route: 'weatherInshort',
  );

  static const tudoo = ProjectModel._(
    title: 'list of to do tasks',
    description: 'Learning of Provider State Management',
    designer: 'Angel Yu',
    pathImage: 'assets/img/projects/tudoo.png',
    route: 'tudoo',
  );

  static const mealApp = ProjectModel._(
    title: 'Meals with recipes',
    description: 'Learning of Riverpod and animation',
    designer: 'Max',
    pathImage: 'assets/img/projects/meals_app.jpg',
    route: 'mealApp',
  );

  static const groceries = ProjectModel._(
    title: 'Groceries List',
    description: 'Working on HTTP requests',
    designer: 'Max',
    pathImage: 'assets/img/projects/weather.png',
    route: 'groceries',
  );

  static const listProjects = [
    expenseTracker,
    weatherInshort,
    tudoo,
    mealApp,
    groceries,
  ];
}