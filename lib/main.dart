import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const TextStyle DeSize = TextStyle(fontSize: 14);

void main() => runApp(const MyApp());

class FavroiteIcon extends StatefulWidget {
  const FavroiteIcon({super.key});

  @override
  State<FavroiteIcon> createState() => _FavroiteIconState();
}

class _FavroiteIconState extends State<FavroiteIcon> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      icon: (_isFavorited
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite,
            )),
      onPressed: () {
        setState(() {
          if (_isFavorited) {
            _isFavorited = false;
          } else {
            _isFavorited = true;
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SwitchWidget(),
        ],
        backgroundColor: Color(0xFF182949),
        title: const Text('SODA'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              MyTextField(),
              SizedBox(
                height: 56,
              ),
              MyRadioButton(),
              MyCheckBox(),
              Padding(
                padding: EdgeInsets.fromLTRB(14, 83, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectText(),
                    SizedBox(
                      width: 10,
                    ),
                    DatePickerButton(),
                  ],
                ),
              ),
            ]),
      ),
      floatingActionButton: MyFAB(),
      drawer: MyDrawer(),
      bottomNavigationBar: MyDivider(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff182949),
            ),
            child: Text(
              'SODA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: FavroiteIcon(),
            title: Text("Icon: favorite"),
          ),
          ListTile(
            leading: FavroiteIcon(),
            title: Text("Icon: favorite"),
          )
        ],
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFF4B6EB1);
        }
        return Color(0xFF797979);
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }

        if (states.contains(MaterialState.disabled)) {
          return Color(0xFF797979);
        }

        return null;
      },
    );

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: (bool value) {
        setState(() {
          light = value;
          if (light == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('switch를 ON 하였습니다.'),
                duration: Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });
      },
    );
  }
}

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("Copyright 2022 SODA  All rights reserved."),
        )
      ],
    );
    ;
  }
}

enum SingingCharacter { male, female }

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  SingingCharacter? _character = SingingCharacter.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Radio<SingingCharacter>(
            value: SingingCharacter.male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Text(
          'Male',
          style: DeSize,
        ),
        SizedBox(
          width: 65,
        ),
        Container(
          child: Radio<SingingCharacter>(
            value: SingingCharacter.female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const Text(
          "Female",
          style: DeSize,
        )
      ],
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffEDEDED)),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Name',
        ),
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isCheckedDes = false;
  bool isCheckedDev = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isCheckedDes,
          onChanged: (bool? value) {
            setState(() {});
            isCheckedDes = value!;
          },
        ),
        Text('Developer', style: DeSize),
        SizedBox(
          width: 29,
        ),
        Checkbox(
          value: isCheckedDev,
          onChanged: (bool? value) {
            setState(() {});
            isCheckedDev = value!;
          },
        ),
        Text('Designer', style: DeSize),
      ],
    );
  }
}

class SelectText extends StatelessWidget {
  const SelectText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        '버튼을 눌러 날짜를 선택해주세요',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  String _selectedDate = '';

  Future _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = (DateFormat.yMMMd()).format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        'SELECT DATE',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xff4B6EB1),
        ),
      ),
      style: TextButton.styleFrom(side: BorderSide(color: Colors.grey)),
      onPressed: () => _selectDate(context),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(
          height: 0,
          thickness: 1,
          indent: 13,
          endIndent: 13,
          color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text('Copyright 2022 SODA. All rights reserved.'),
        ),
        SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}

class MyFAB extends StatefulWidget {
  const MyFAB({super.key});

  @override
  State<MyFAB> createState() => _MyFABState();
}

class _MyFABState extends State<MyFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('+ 버튼을 누르셨습니다.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('확인'),
                  )
                ],
              )),
      backgroundColor: Color(0xff182949),
      child: const Icon(Icons.add),
    );
  }
}
