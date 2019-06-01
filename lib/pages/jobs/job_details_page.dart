import 'package:flutter/material.dart';
import 'package:surflutter/models/job.dart';

class JobDetailsPage extends StatelessWidget {
  final Job job;
  const JobDetailsPage({Key key, @required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(4.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  job.company ?? 'Freelance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  job.title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Divider(),
                SizedBox(height: 8.0),
                Text(
                  job.description ?? 'No description provided',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Divider(),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '7 days',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Remote',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '${job.money}\$',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(4.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
