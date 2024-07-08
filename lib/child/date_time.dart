import 'package:flutter/material.dart';
import 'package:palugada/child/addres_selection.dart';

class DateTimeSelectionPage extends StatefulWidget {
  @override
  _DateTimeSelectionPageState createState() => _DateTimeSelectionPageState();
}

class _DateTimeSelectionPageState extends State<DateTimeSelectionPage> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> dates = ['Tue 29', 'Wed 30', 'Thu 31', 'Fri 01', 'Sat 02'];
    List<String> times = [
      '10:00 AM',
      '11:00 AM',
      '12:30 PM',
      '01:30 PM',
      '03:00 PM',
      '04:30 PM'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date & Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Untuk menengahkan
              children: List.generate(dates.length, (index) {
                var day = dates[index].split(' ')[0];
                var date = dates[index].split(' ')[1];
                return ChoiceChip(
                  label: Column(
                    children: [
                      Text(day),
                      Text(
                        date,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  selected: selectedDateIndex == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Select Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8), // Jarak antara Select Time dan ChoiceChips
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Untuk menengahkan
                  children: List.generate(times.length ~/ 2, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Center(
                            child: Text(times[index]),
                          ),
                          selected: selectedTimeIndex == index,
                          onSelected: (selected) {
                            setState(() {
                              selectedTimeIndex = index;
                            });
                          },
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Untuk menengahkan
                  children: List.generate(times.length ~/ 2, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Center(
                            child: Text(times[index + times.length ~/ 2]),
                          ),
                          selected:
                              selectedTimeIndex == index + times.length ~/ 2,
                          onSelected: (selected) {
                            setState(() {
                              selectedTimeIndex = index + times.length ~/ 2;
                            });
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedTimeIndex != -1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressSelectionPage()),
                      );
                    }
                  : null,
              child: Text('Proceed to Checkout',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Color.fromARGB(255, 104, 55, 161),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
