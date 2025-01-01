import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_trainings_app/model.dart';
import 'package:my_trainings_app/widgets/bottom_sheet_widget.dart';
import 'package:my_trainings_app/widgets/profile_avatar.dart';
import '../widgets/vertical_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  late TrainingSession selectedData;
  List<String> items = [];

  @override
  void initState() {
    items = sessions.map((e) => e.trainingName).toList();

    selectedData = TrainingSession(
      trainingName: "Programming",
      trainer: "Joe",
      location: "America,USA",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: const Text(
            'Trainings',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Scaffold.of(context).openEndDrawer();
                  });
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.red),
                height: screenHeight * 0.25,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.08,
                    top: screenHeight * 0.08,
                  ),
                  child: const Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: screenHeight * 0.16,
                        ),
                        const SizedBox(
                          height: 15,
                        ), // Adjusted spacing
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                          ),
                          height: screenHeight * 0.18, // Adjusted height
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Oct 11 - 15, 2024',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        '09:30 AM - 12:30 PM',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        selectedData
                                            .location, //'Chennai Anna Nagar Tower Park',
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const DashedVerticalDivider(),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Filling Fast!',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            selectedData
                                                .trainingName, //'Safe Scrum Master(4.6)',
                                            style: const TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              const ProfileAvatar(
                                                  profileImage: AssetImage(
                                                "assets/image/download.jpg",
                                              )),
                                              const SizedBox(width: 8.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Keynote Speaker',
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    selectedData
                                                        .trainer, //'Helen Gribble',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: SizedBox(
                                          height: screenHeight * 0.04,
                                          width: screenWidth * 0.25,
                                          child: FilledButton(
                                            onPressed: () {
                                              // Add your onPressed logic here
                                            },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: const EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                            child: const Text(
                                              'Enrol Now',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: CarouselSlider(
                items: [
                  _buildCarouselItem(context),
                  _buildCarouselItem(context),
                  _buildCarouselItem(context),
                ],
                options: CarouselOptions(
                  height: screenHeight * 0.2,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
                carouselController: _carouselController,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: screenHeight * 0.35,
            child: GestureDetector(
              onTap: () {
                _showBottomSheet(context, (value) {
                  setState(() {
                    selectedData = value;
                  });
                }, selectedData);
              },
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.vertical_distribute_sharp,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      maxLines: 1,
                      "Filter",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildCarouselButton(true, screenHeight),
          _buildCarouselButton(false, screenHeight),
        ],
      ),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildCarouselItem(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/image/masks_oudoors.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            child: Container(
          color: Colors.black.withOpacity(0.6),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text(
                'Safe Scrum Master',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'west Des Moines IA - 30 Oct-31 Oct',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$975',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: ' \$875',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'View Details →',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarouselButton(bool isPrevious, double screenHeight) {
    return Positioned(
      left: isPrevious ? 0 : null,
      right: isPrevious ? null : 0,
      top: screenHeight * 0.18,
      child: Container(
        width: 30,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.black12,
        ),
        child: IconButton(
          icon: Icon(
            isPrevious ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            if (isPrevious) {
              _carouselController.previousPage();
            } else {
              _carouselController.nextPage();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'My Trainings App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  items[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    ValueChanged<TrainingSession> trainingSession,
    TrainingSession? selectedSessionData,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BottomSheetWidget(
                selectedSessionData: selectedSessionData,
                onChangeFilterData: (value) {
                  trainingSession(value);
                });
          },
        );
      },
    );
  }
}
