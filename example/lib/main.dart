import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/classes/slot_model.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dooboolab flutter calendar',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calendar Carousel Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime _currentDate2 = DateTime.now();

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static final Widget _eventIcon = DecoratedBox(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2)),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2019, 2, 10): [
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1),
            color: Colors.red,
            height: 5,
            width: 5,
          ),
        ),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        // Event(
        //   date: DateTime(2019, 2, 10),
        //   title: 'Event 3',
        //   icon: _eventIcon,
        // ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        DateTime(2019, 2, 25),
        Event(
          date: DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2019, 2, 10),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2019, 2, 11), [
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  List<SlotModel> list=[
    SlotModel(DateTime.now(), 3),
    SlotModel(DateTime(2025,4,4), 10),
    SlotModel(DateTime(2025,4,9), 1),
    SlotModel(DateTime(2025,4,26), 24),
    SlotModel(DateTime(2025,4,28), 4),
    SlotModel(DateTime(2025,5,3), 4),
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              CalendarCarousel(
                daysBorderRadius: BorderRadius.circular(12),
                height: 400,
                selectedDayButtonColor: Colors.blue,
                onDayPressed: (s,e){
                  setState(() => _currentDate2 = s);
                },
                 //   onlyThisMonth: true,
                selectedDateTime: _currentDate2,
                thisMonthDayBorderColor: Colors.black,
                daysHaveCircularBorder: false,
               // markedDatesMap: _markedDateMap,
               // showIconBehindDayText: true,
                markedDateCustomShapeBorder: RoundedRectangleBorder(),
               pageSnapping : true,
                slotColor: Colors.black54,
                slots: list,
              ),


            ],
          ),
        ));
  }
}
