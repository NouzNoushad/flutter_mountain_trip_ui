import 'package:flutter/material.dart';

class TripHomePage extends StatefulWidget {
  const TripHomePage({super.key});

  @override
  State<TripHomePage> createState() => _TripHomePageState();
}

class _TripHomePageState extends State<TripHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 6, vsync: this);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          color: Colors.black,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 10, 18, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.tune),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'High Mountain Trip',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Mountain Route',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: RotatedBox(
                quarterTurns: 3,
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: TabBar(
                      controller: controller,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.grey.shade600,
                      unselectedLabelColor: Colors.grey.shade500,
                      isScrollable: true,
                      tabs: [
                        'SouthWest',
                        'Southeast',
                        'East',
                        'North',
                        'West',
                        'South',
                      ].map((direction) {
                        return Text(direction);
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: TabBarView(
                        controller: controller,
                        children: const [
                          MountainTripLocations(),
                          Center(
                            child: Text(
                              'South East',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'East',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'North',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'West',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'South',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MountainTripLocations extends StatefulWidget {
  const MountainTripLocations({super.key});

  @override
  State<MountainTripLocations> createState() => _MountainTripLocationsState();
}

class _MountainTripLocationsState extends State<MountainTripLocations> {
  int pageSelectedIndex = 0;
  List<Map<String, dynamic>> mountains = [
    {
      'image': 'mountain3.jpg',
      'name': 'Dark Mountain',
      'distance': 150,
    },
    {
      'image': 'mountain2.jpg',
      'name': 'Beautiful Mountain',
      'distance': 120,
    },
    {
      'image': 'mountain4.jpg',
      'name': 'Cool Mountain',
      'distance': 130,
    },
    {
      'image': 'mountain1.jpg',
      'name': 'Amazing Mountain',
      'distance': 180,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      padEnds: false,
      onPageChanged: (index) {
        setState(() {
          pageSelectedIndex = index;
        });
      },
      itemCount: mountains.length,
      itemBuilder: (context, index) {
        var scale = pageSelectedIndex == index ? 1.0 : 0.8;
        final mountain = mountains[index];
        return TweenAnimationBuilder(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: scale, end: scale),
          curve: Curves.easeInOut,
          builder: (context, value, child) => Transform.scale(
            scale: value,
            child: child,
          ),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/${mountain['image']}'),
                    fit: BoxFit.cover),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      mountain['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'Distance to ${mountain['distance']}km',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
