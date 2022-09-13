
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskes_project/home_Api/home_provider.dart';


class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getAllData();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: ((context, HomeProv, child) {
        return Scaffold(
            appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('Products')),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
          body: 
          Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                      Container(
            color: Color.fromARGB(255, 215, 209, 209),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
               itemCount: HomeProv.data!.data!.products!.length,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 13,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                                                image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(HomeProv.data!
                                                  .data!.products![index].image
                                                  .toString()),
                                            )),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.energy_savings_leaf,color: Colors.white,),
                              Text(HomeProv.data!.data!.products![index].discount==null?"0%":
                              HomeProv.data!.data!.products![index].discount.toString(),style: TextStyle(color: Colors.black,fontSize: 11),
                              ),
                              Spacer(),
                              Icon(Icons.favorite_border,color: Colors.white,),
                            ],
                          ),
                        ),
                        
                        Text(
                          HomeProv.data!.data!.products![index].name.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          HomeProv.data!.data!.products![index].id.toString(), 
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                             HomeProv.data!.data!.products![index].price.toString(), 
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Icon(Icons.add_shopping_cart_outlined),
                            ),
                          ],
                        ),
                        Text(
                          HomeProv.data!.data!.products![index].oldPrice.toString(),
                          style: TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  );
                }),
          )
                  ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
