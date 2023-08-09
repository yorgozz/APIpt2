import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/propertyModel.dart';
import 'package:task6/provider/property_provider.dart';
import 'package:task6/presentation/shared_widgets/CarouselWidget.dart';
import 'package:task6/models/spaceModel.dart';
import 'package:task6/presentation/shared_widgets/BurgerDrawer.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  @override
  void initState() {
    super.initState();
    final propertyProvider =
        Provider.of<PropertyProvider>(context, listen: false);
    propertyProvider.fetchAllProperties();
  }

  @override
  Widget build(BuildContext context) {
    List<PropertyModel> properties =
        Provider.of<PropertyProvider>(context).properties;
    PropertyModel? selectedProperty =
        Provider.of<PropertyProvider>(context).selectedProperty;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Burger(),
      appBar: AppBar(
        backgroundColor: Color(0xFF3C4955),
        toolbarHeight: 160,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: Column(
          children: [
            SizedBox(height: 5),
            Row(children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: SvgPicture.asset(
                  'assets/Group 13892.svg',
                  color: Colors.white,
                  width: 20,
                ),
              ),
              Container(
                width: 310,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(178, 187, 202, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<PropertyModel>(
                  value: Provider.of<PropertyProvider>(context, listen: false)
                      .selectedProperty,
                  items: properties
                      .map(
                        (prop) => DropdownMenuItem<PropertyModel>(
                          value: prop,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0, 24.0, 0),
                            child: Text(
                              prop.propertyName,
                              style: TextStyle(
                                color: Color.fromRGBO(50, 62, 72, 1),
                                fontSize: 14.0,
                                fontFamily: 'MontserratRegular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  icon: SvgPicture.asset(
                    'assets/Icon-16x-dropdown.svg',
                    color: Color.fromARGB(217, 13, 6, 18),
                    width: 20,
                  ),
                  onChanged: (prop) {
                    Provider.of<PropertyProvider>(context, listen: false)
                        .setSelectedProperty(prop!);
                  },
                  hint: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 160.0, 0),
                    child: Text(
                      'Select property',
                      style: TextStyle(
                        color: Color.fromRGBO(178, 187, 202, 1),
                        fontSize: 14.0,
                        fontFamily: 'MontserratRegular',
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5.0, 0),
                  child: Container(
                      width: 168,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(178, 187, 202, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: null,
                        items: [],
                        onChanged: (value) {},
                        hint: Row(
                          children: [
                            SizedBox(width: 8),
                            SvgPicture.asset(
                              'assets/Group 13884.svg',
                              color: Color.fromARGB(217, 13, 6, 18),
                              width: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Select Dates',
                              style: TextStyle(
                                color: Color.fromRGBO(178, 187, 202, 1),
                                fontSize: 14.0,
                                fontFamily: 'MontserratRegular',
                              ),
                            ),
                          ],
                        ),
                        icon: Row(
                          children: [
                            SizedBox(width: 16),
                            SvgPicture.asset(
                              'assets/Icon-16x-dropdown (1).svg',
                              color: Color.fromARGB(217, 13, 6, 18),
                              width: 20,
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(width: 5),
                Container(
                  width: 165.5,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(178, 187, 202, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    value: null,
                    items: [],
                    onChanged: (value) {},
                    hint: Row(
                      children: [
                        Icon(
                          Icons.person_add_outlined,
                          color: Color.fromARGB(217, 13, 6, 18),
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Guests & Rooms',
                          style: TextStyle(
                            color: Color.fromRGBO(178, 187, 202, 1),
                            fontSize: 14.0,
                            fontFamily: 'MontserratRegular',
                          ),
                        ),
                      ],
                    ),
                    icon: SvgPicture.asset(
                      'assets/Icon-16x-dropdown (1).svg',
                      color: Color.fromARGB(217, 13, 6, 18),
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF9F9F9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '    Available Spaces',
                style: TextStyle(
                  color: Color.fromRGBO(17, 21, 27, 0.903),
                  fontSize: 16.0,
                  fontFamily: 'MontserratMedium',
                ),
              ),
            ),
            SizedBox(height: 16),
            if (selectedProperty != null)
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: selectedProperty.availableSpaces.length,
                  separatorBuilder: (context, index) => SizedBox(height: 40),
                  itemBuilder: (context, index) {
                    SpaceModel space = selectedProperty.availableSpaces[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CarouselWidget(
                        carouselImages: space.spaceImages,
                        propertyName: selectedProperty.propertyName,
                        spaceTitle: space.spaceTitle,
                        spaceDescription: space.spaceDescription,
                        spaceRating: space.spaceRating,
                        spacePrice: space.spacePrice,
                      ),
                    );
                  },
                ),
              ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
