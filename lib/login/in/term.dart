import 'package:flutter/material.dart';

class TermSreen extends StatefulWidget {
  const TermSreen({super.key});

  @override
  State<TermSreen> createState() => _TermSreenState();
}

class _TermSreenState extends State<TermSreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            bottom: 15.0,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est voluptate magnam dignissimos tempore beatae doloribus eos quasi.\n\n\nAccusamus laborum ducimus rerum dolore enim ad in aperiam! Dignissimos quia dicta laudantium Veritatis, eum consequatur ut enim vel nam velit aspernatur ipsum, accusamus praesentium aperiam quod. Rerum excepturi assumenda ad error dolorum et, atque laudantium itaque praesentium dignissimos totam nobis voluptatum dolores. Dignissimos et commodi aliquam id molestiae ab repudiandae non nesciunt voluptate expedita quos est vero, rerum qui facere facilis veritatis. Quo voluptatum minus nostrum dignissimos possimus veniam quae excepturi porro. Totam alias culpa aliquam deleniti. Quia, sapiente tempora quidem, blanditiis temporibus tenetur nam perspiciatis eaque totam magnam quae at dolores obcaecati iste qui! Sint, quo est?\n\n\nFugit tenetur quaerat voluptatem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Est voluptate magnam dignissimos tempore beatae doloribus eos quasi. Lorem ipsum dolor sit amet consectetur adipisicing elit. Est voluptate magnam dignissimos tempore beatae doloribus eos quasi.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Est voluptate magnam dignissimos tempore beatae doloribus eos quasi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Est voluptate magnam dignissimos tempore beatae doloribus eos quasi.\n\n\nAccusamus laborum ducimus rerum dolore enim ad in aperiam! Dignissimos quia dicta laudantium Veritatis, eum consequatur ut enim vel nam velit aspernatur ipsum, accusamus praesentium aperiam quod. Rerum excepturi assumenda ad error dolorum et, atque laudantium itaque praesentium dignissimos totam nobis voluptatum dolores. Dignissimos et commodi aliquam id molestiae ab repudiandae non nesciunt voluptate expedita quos est vero, rerum qui facere facilis veritatis. Quo voluptatum minus nostrum dignissimos possimus veniam quae excepturi porro. Totam alias culpa aliquam deleniti. Quia, sapiente tempora quidem, blanditiis temporibus tenetur nam perspiciatis eaque totam magnam quae at dolores obcaecati iste qui! Sint, quo est?'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 0.0,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () => print('Send'),
                child: Text(
                  'Read & Accept'.toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
