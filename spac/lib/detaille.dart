import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:spac/not.dart';
import 'package:spac/principale.dart';
//import 'package:spac/shop.dart';




class Detaille extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Detaille> {
  bool isSelectedA = false;
  bool isSelectedB = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff00c7a1),
          title: Text(
            'Detaills de Facturation',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // يعود للصفحة السابقة
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5.0), // تغيير الارتفاع هنا
                Text(
                  'Nom et Prenom',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0, // تغيير حجم الخط هنا
                    color:  Colors.black,
                  ),
                ),
                SizedBox(height: 5.0), // تغيير الارتفاع هنا
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0), // تغيير الارتفاع هنا
                  ),
                ),
                SizedBox(height: 5.0), // تغيير المسافة بين الخانات
                Text(
                  'Adresse',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0, // تغيير حجم الخط هنا
                    color:  Colors.black,
                  ),
                ),
                SizedBox(height: 5.0), // تغيير الارتفاع هنا
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0), // تغيير الارتفاع هنا
                  ),
                ),
                SizedBox(height: 5.0), // تغيير المسافة بين الخانات
                Text(
                  'Tel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0, // تغيير حجم الخط هنا
                    color:  Colors.black,
                  ),
                ),
                SizedBox(height: 5.0), // تغيير الارتفاع هنا
                TextField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly, // استخدام FilteringTextInputFormatter.digitsOnly بدلاً من FilteringTextInputFormatter.allow
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0), // تغيير الارتفاع هنا
                    hintText: '213XXXXXXXXX',
                  ),
                ),
                SizedBox(height: 5.0), // تغيير المسافة بين الخانات وبين الشريط الأخضر
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wilaya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0, // تغيير حجم الخط هنا
                              color:  Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.0), // تغيير الارتفاع هنا
                          Container(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5.0), // تغيير الارتفاع هنا
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ville',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0, // تغيير حجم الخط هنا
                              color:  Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.0), // تغيير الارتفاع هنا
                          Container(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5.0), // تغيير الارتفاع هنا
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0), // زيادة المسافة بين الخانات
                Container(
                  color: Color(0xff00c7a1),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0), // تغيير ارتفاع الشريط الأخضر
                  child: Text(
                    'Mode de Paiement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0, // تغيير حجم الخط هنا
                    ),
                  ),
                ),
                SizedBox(height:15.0), // تغيير المسافة بين الشريط الأخضر والخانتين
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedA = true;
                      isSelectedB = false;
                    });
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelectedA ? Color(0xff00c7a1) : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'A la livraison',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0, // تغيير حجم الخط هنا
                          color: isSelectedA ? Colors.white : Color(0xff00c7a1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0), // تغيير المسافة بين الخانات
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedB = true;
                      isSelectedA = false;
                    });
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelectedB ? Color(0xff00c7a1) : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'baridimob',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0, // تغيير حجم الخط هنا
                          color: isSelectedB ? Colors.white : Color(0xff00c7a1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0), // تغيير المسافة بعد الخانات
                ElevatedButton(
                  onPressed: () {
                    // Perform action on button press
                  },
                  child: Text(
                    'Valider',
                    style: TextStyle(color: Colors.white), // تغيير لون النص هنا
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00c7a1),
                  ),
                ),

                SizedBox(height: 10.0), // تغيير المسافة بين الزر والخانات
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
    IconButton(
    icon: Icon(Icons.store, color: Color(0xff00c7a1)),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>Principale ()));
    },
    ),
    IconButton(
    icon: Icon(Icons.home, color: Color(0xff00c7a1)),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Principale()));
    }

    ),
    IconButton(
    icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>Principale()));
    },
    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}