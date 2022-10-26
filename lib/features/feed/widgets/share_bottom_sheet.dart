
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
           height: 200,
           decoration:  BoxDecoration(

           ),

          child: Column(
            children: [
              SizedBox(height: 8,),
              Container(
                width: 50,
                  child: Divider( height: 2,thickness: 4,)),
              SizedBox(height: 5,),
              Center(
                child: Text("Share post", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Icon(Icons.share),
                   SizedBox(width: 10,),
                  Text("Send as a private message")

                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  // Image.asset("assets/images/post.svg", height: 30,width: 30,),
                  SizedBox(width: 10,),
                  Text("Share as a post")

                ],
              ),
              SizedBox(height: 8,),
              Divider( height: 1,thickness: 1,),
              SizedBox(height: 8,),
              Row(
                children: [
                  // Image.asset("assets/images/fb_icon.svg"),
                  SizedBox(width: 10,),
                  Text("Share on Facebook")

                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  // ImageIcon(AssetImage("assets/images/whatsapp.svg"), size: 30, color: Colors.amber,),
                  // Container(child: Image.asset("assets/images/whatsapp.svg")),
                  SizedBox(width: 10,),
                  Text("Send via WhatsApp")
                ],
              ),

            ],
          ),
        ),
      )
    );
  }
}
