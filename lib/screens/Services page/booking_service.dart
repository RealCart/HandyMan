import 'package:flutter/material.dart';
import 'package:handy_man/components/service_hours_widget.dart';
import 'package:handy_man/components/slider/slider_widget.dart';
import 'package:handy_man/models/service.dart';

class BookingService extends StatefulWidget {
  const BookingService({
    super.key,
    required this.service,
  });

  final Service service;
  @override
  State<BookingService> createState() => _BookingServiceState();
}

class _BookingServiceState extends State<BookingService> {
  double _sliderValue = 1500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 218,
            width: double.infinity,
            color: const Color(0xffF1C40F),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: -17,
                      child: Image.asset(
                        "assets/images/booking_service.png",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Material(
                            color: Color.fromRGBO(255, 255, 255, 0.34),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 13.5,
                                top: 13.27,
                                right: 6.5,
                                bottom: 12.38,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 27.0),
                        Text(
                          widget.service.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 1.5,
                          ),
                        ),
                        ServiceHoursWidget(
                            serviceHours: widget.service.amountOfHours),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 2.0,
                                ),
                                child: Text(
                                  '${widget.service.rating}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              "reviews",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Appartament Size"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 36.0,
                        right: 9.0,
                        bottom: 10.0,
                      ),
                      child: Column(
                        children: [
                          SliderWidget(
                            initialValue: _sliderValue,
                            onChanged: ((double newValue) {
                              setState(() {
                                _sliderValue = newValue;
                              });
                            }),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "40",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "9000",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text("Number of Room"),
                  const SizedBox(height: 10.0),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
