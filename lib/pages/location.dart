import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../services/preferences_service.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/custom_button.dart';
import '../widgets/navigation_bar.dart';
import '../generated/l10n.dart';
import '../services/location_service.dart';
import 'home.dart';
import 'login.dart';
import 'orders.dart';
import 'fruits.dart';
import 'checkout.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int selectedIndex = 0;
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String address = "";
  TextEditingController nameController = TextEditingController();

  Future<LatLng> getCurrentLocation() async {
    LocationPermission permission =
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return LatLng(position.latitude, position.longitude);
  }

  Future<void> getAddressFromLatLng(LatLng location) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(
        location.latitude, location.longitude);

    Placemark place = placemarks.first;

    setState(() {
      address =
      "${place.street}, ${place.locality}, ${place.country}";
    });
  }

  /// ✅ حفظ الموقع للمستخدم الحالي
  Future<void> saveLocation() async {
    if (selectedLocation == null ||
        nameController.text.isEmpty ||
        address.isEmpty) {
      return;
    }

    await LocationService.saveLocation(
      name: nameController.text,
      location: selectedLocation!,
      address: address,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).locationSaved)),
    );
  }

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(11);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder<LatLng>(
                  future: getCurrentLocation(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator());
                    }

                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: snapshot.data!,
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      onTap: (LatLng location) {
                        setState(() {
                          selectedLocation = location;
                        });
                        getAddressFromLatLng(location);
                      },
                      markers: selectedLocation == null
                          ? {}
                          : {
                        Marker(
                          markerId:
                          const MarkerId("selected"),
                          position: selectedLocation!,
                        )
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).locationName,
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      margin: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: const Color(0xffEFEFEF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          border: InputBorder.none,
                          hintText: S.of(context).egLocation,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).deliveryLocation,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(address,
                        style:
                        const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 15),
                    CustomButton(
                      Btext: S.of(context).confirmL,
                      onTap: () async {
                        await saveLocation();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              NavigationBarr(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });

                  if (index == 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  } else if (index == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
                  } else if (index == 2) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Fruits()));
                  } else if (index == 3) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  }
                },
              ),
            ],
          ),
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogIn()));
              },
              child: BackButton(),
            ),
          ),
        ],
      ),
    );
  }
}