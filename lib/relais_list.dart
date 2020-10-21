import 'package:flutter/material.dart';
import 'package:magTechClient/CustomAppBar.dart';
import 'package:magTechClient/CustomShapeClipper.dart';
import 'package:magTechClient/main.dart';

final Color discountBackgroungColor = Color(0xFFFF0000);
final Color flishBorderColor = Color(0xFFEF772C);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class relaisList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.green,
        
        title: Text(
          "Partenaire",
         
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListTopPart(),
            SizedBox(height: 20.0,),
            FlishListBottomPart(),
          ],
        ),
      ),
    );
  }
}
class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
              colors: [firstColor, secondColor]
              ),
              ),
              height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                 child: Row(
                   mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                         flex: 5,
                         child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text("MagTech",
                       style: TextStyle(
                         fontSize: 16.0,
                       ),
                       ),
                       Divider(color: Colors.grey,height: 20.0,),
                       Text("partenaire", 
                       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                       ),
                         ],
                       ),
                     ),
                     Spacer(),
                     Expanded(
                       flex: 1,
                       child: Icon(Icons.import_export, color: Colors.black, size: 24.0,)),
                   ],
                 ),
              ) ,
            ),
          ],
        )
      ],

    );
  }
}

class FlishListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Entreprise",
              style: dropDownMenuItemStyle,
            ),
          ),
          SizedBox(height: 16.0,),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              FlightCard(),
              
              
            ],
          )
          
        ],
      ),

    );
  }
}
class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'ICI IMAGE', 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0,
                            
                          ),
                        )
                      ],
                    ),
                    Wrap(

                      spacing: 8.0,
                      runSpacing: -8.0,
                      children: <Widget>[
                        FlightDetailChip(Icons.business_center,'Station'),
                        FlightDetailChip(Icons.business_center,'Car wash'),
                        FlightDetailChip(Icons.shopping_basket,'Restau'),


                      ],
                    )
                  ],
                  
                ),
              ),
          ),
          // Positioned(
          //     top: 20.0,
          //     right: 0.0,
          //     child: Container(
          //      child: Text("00",
          //       style: TextStyle(color: appTheme.primaryColor,
          //       fontSize: 14.0), ),
          //     decoration: BoxDecoration(color: discountBackgroungColor)
          //     ),
            
          // ),
          
        ],
        
      ),
    );
  }
}
class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;
  FlightDetailChip(this.iconData, this.label);
  @override
  Widget build(BuildContext context) {
    return RawChip(
       label: Text(label),
       labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
       backgroundColor: chipBackgroundColor,
       avatar: Icon(iconData, size: 14.0,),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(10.0)) ),
    );
  }
}