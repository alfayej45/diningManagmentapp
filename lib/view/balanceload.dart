import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BalanceLoadRequestUser extends StatefulWidget {
  BalanceLoadRequestUser({Key? key}) : super(key: key);

  @override
  State<BalanceLoadRequestUser> createState() => _BalanceLoadRequestUserState();
}

class _BalanceLoadRequestUserState extends State<BalanceLoadRequestUser> {
 final TextEditingController username =  TextEditingController();
  final TextEditingController token =  TextEditingController();
  final TextEditingController amount =  TextEditingController();

// Its balance load request function

 Future<void> balancerequest() async {
    final collucrion = FirebaseFirestore.instance.collection('Balance Load');
    await collucrion.add({
      "name": username.text,
      "token": token.text,
      "amount": amount.text,
      
    });

   username.text = ""; 
    token.text = "";
    amount.text = "";
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 70
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/load.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: token,
                  decoration: InputDecoration(
                    labelText: "Token Name",
                    hintText: "Enter your token name",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: amount,
                  decoration: InputDecoration(
                    labelText: "Amount",
                    hintText: "Enter your amount",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                child: InkWell(
                  onTap: (){
                    balancerequest();
                    print("Successfully send request");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(9)
                    ),
                    child: const Text(
                      "Balance Request",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}