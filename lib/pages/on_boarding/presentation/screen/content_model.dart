class OnBoardingModel{
  String image;
  String title;
  String description;
  OnBoardingModel({required this.image,required this.title,required this.description});
}
List<OnBoardingModel> contents=[
  OnBoardingModel(
    title: 'Discover Delicious Meals',
    image: 'assets/images/boarding1.png',
    description: 'Highlight how users can find and order food effortlessly.'
  ),
  OnBoardingModel(
    title: 'Discover Delicious Meals',
    image: 'assets/images/boarding2.png',
    description: 'Highlight how users can find and order food effortlessly.'
  ),
  OnBoardingModel(
    title: 'Discover Delicious Meals',
    image: 'assets/images/boarding3.png',
    description: 'Highlight how users can find and order food effortlessly.'
  )
];