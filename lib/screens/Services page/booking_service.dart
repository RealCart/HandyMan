import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/booking_constraints_bloc/booking_constraints_bloc.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/presentation/service_hours_widget.dart';
import 'package:handy_man/presentation/slider/slider_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class BookingService extends StatefulWidget {
  const BookingService({
    super.key,
    required this.service,
  });

  final Map<String, dynamic> service;

  @override
  State<BookingService> createState() => _BookingServiceState();
}

class _BookingServiceState extends State<BookingService> {
  double _sliderValue = 100;

  int _selectedRooms = 1;
  final DateTime _today = DateTime.now();
  late DateTime _endDate;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedAdress = 'Please chose your adress';
  List<String> userAdress = <String>['first', 'seconde', 'third'];

  @override
  void initState() {
    super.initState();
    _endDate = DateTime(_today.year, _today.month + 3, _today.day);
  }

  List<DateTime> _generateDateList() {
    List<DateTime> dates = [];
    DateTime current = DateTime(_today.year, _today.month, _today.day);
    while (current.isBefore(_endDate) || current.isAtSameMomentAs(_endDate)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  List<TimeOfDay> _generateTimeList() {
    List<TimeOfDay> times = [];
    for (int hour = 8; hour < 24; hour++) {
      times.add(TimeOfDay(hour: hour, minute: 0));
    }
    return times;
  }

  void _showCommentField(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextField(
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Комментарий к заказу',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (text) {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void selectAdress(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _selectedAdress = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingConstraintsBloc()..add(GetBookingConstraintsEvent()),
      child: BlocBuilder<BookingConstraintsBloc, BookingConstraintsState>(
        builder: (context, state) {
          if (state is LoadingBookingConstraintsState) {
            return const Scaffold(
              backgroundColor: Color(0xffF6F6F6),
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xffF1C40F),
                ),
              ),
            );
          }

          if (state is FailledBookingConstraintsState) {
            return Text("Ошибка при получении данных: ${state.errorMessage}");
          }

          if (state is SuccessfullyBookingConstraintsState) {
            List<DateTime> dateList = _generateDateList();
            List<TimeOfDay> timeList = _generateTimeList();

            return Scaffold(
              backgroundColor: const Color(0xffF6F6F6),
              extendBodyBehindAppBar: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 236,
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
                                  widget.service['name'],
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    wordSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                ServiceHoursWidget(
                                  serviceHours: widget.service['duration'],
                                ),
                                const SizedBox(height: 9.0),
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
                                          '${widget.service['rating']}',
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
                      child: ListView(
                        children: [
                          const Text(
                            "Appartament Size",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                                    maxValueSlider:
                                        state.data['max_apartment_size'],
                                    minValueSlider:
                                        state.data['min_apartment_size'],
                                    onChanged: (double newValue) {
                                      setState(() {
                                        _sliderValue = newValue;
                                      });
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${state.data['min_apartment_size']}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${state.data['max_apartment_size']}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Number of Room",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data["max_number_rooms"],
                              itemBuilder: (context, index) {
                                int roomCount = index + 1;
                                bool isSelected = (_selectedRooms == roomCount);
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FilterChip(
                                    showCheckmark: false,
                                    selectedColor: const Color(0xffF1C40F),
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide.none,
                                    ),
                                    label: Text(
                                      roomCount.toString().padLeft(2, '0'),
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : const Color(0xffD6D6D6),
                                        fontSize: 16,
                                      ),
                                    ),
                                    selected: isSelected,
                                    onSelected: (_) {
                                      setState(() {
                                        _selectedRooms = roomCount;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Select Date",
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 10.0),
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dateList.length,
                              itemBuilder: (context, index) {
                                DateTime date = dateList[index];
                                bool isSelected = (_selectedDate != null &&
                                    DateUtils.dateOnly(_selectedDate!) == date);

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  },
                                  child: Container(
                                    width: 48,
                                    margin: const EdgeInsets.only(right: 7.0),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xffF1C40F)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateFormat('MMM')
                                              .format(date)
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : const Color(0xffD9D9D9),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('dd').format(date),
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : const Color(0xffD9D9D9),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('EEE')
                                              .format(date)
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : const Color(0xffD9D9D9),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Select Time",
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 10.0),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: timeList.length,
                              itemBuilder: (context, index) {
                                TimeOfDay time = timeList[index];
                                bool isSelected = (_selectedTime == time);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTime = time;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xffF1C40F)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${time.hour.toString().padLeft(2, '0')}:00',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 21),
                          const Text(
                            'Select Address',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: DropdownButton<String>(
                              items: userAdress.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              value: userAdress.contains(_selectedAdress)
                                  ? _selectedAdress
                                  : null,
                              hint: const Text('Please chose your adress'),
                              onChanged: selectAdress,
                              isExpanded: true,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              isDense: true,
                              padding: const EdgeInsets.only(
                                left: 17.0,
                                top: 11.0,
                                right: 14.0,
                                bottom: 11.0,
                              ),
                              underline: const SizedBox(),
                              icon: Transform.rotate(
                                angle: 3 / 2 * pi,
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 21),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: const Color.fromRGBO(124, 124, 124, 0.5),
                          ),
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () => _showCommentField(context),
                            child: Container(
                              width: double.infinity,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/commentIcon.svg",
                                        ),
                                        const SizedBox(width: 10.0),
                                        const Text(
                                          "Комментарий к заказу",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C7C7C),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Transform(
                                    transform: Matrix4.rotationY(pi),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Color.fromRGBO(124, 124, 124, 0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          CustomButton(
                            labelText: "Book now",
                            onPress: () {},
                          ),
                          const SizedBox(height: 15),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: ElevatedButton.icon(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: const Color(0xffF1C40F),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //     ),
                          //     onPressed: () => _showCommentField(context),
                          //     icon: const Icon(Icons.comment),
                          //     label: const Text('Комментарий к заказу'),
                          //   ),
                          // ),
                          // if (_selectedDate != null && _selectedTime != null)
                          //   Container(
                          //     padding: const EdgeInsets.all(12),
                          //     decoration: BoxDecoration(
                          //       color: Colors.green.shade50,
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     child: Text(
                          //       'Вы выбрали: \n'
                          //       '• Кол-во комнат: $_selectedRooms\n'
                          //       '• Дата: ${DateFormat('dd.MM.yyyy').format(_selectedDate!)}\n'
                          //       '• Время: ${_selectedTime!.hour.toString().padLeft(2, '0')}:00\n'
                          //       '• Площадь: $_sliderValue',
                          //       style: const TextStyle(fontSize: 16),
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
