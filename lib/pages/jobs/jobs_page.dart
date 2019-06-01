import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surflutter/models/job.dart';
import 'package:surflutter/pages/jobs/job_details_page.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(4.0),
                clipBehavior: Clip.antiAlias,
                color: Colors.white10,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: ListTile(
                    title: Text(
                      'Filter by',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Remote',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              JobTile(
                job: Job(
                  company: null,
                  title:
                      'Flutter existing project. Correct the app code mistakes',
                  description: '''There is an application on flutter (bloc, db)

4 windows

Registration - List of orders - Order - Add the photos

The list of applications is taken after registration from url in json format, then it is written and read from the local database

Application structure:

Title (already ok)

Static block, title + jobs (ok)

Blocks of jobs, lists of which come from json. were fixed, everything was worked.

Began to finish, crumbled something. Jobs have fixed set of subtasks. That work.

There either a boolean checkbox, or attaching photos.

Lower comment (ok) and geolocation map (sometimes falls off) located.

What should be done:

1. Lost synchronization of events. After registration, the List window is initially redrawn empty. without waiting for the database filled. The next attempts it works. It is necessary to align the events so that the window of the list of applications initially waited for receiving and parsing json, writing it to the database and receiving data already from the database (db r/w are working processes)

2. Fix the application window. Now, with taps, order sometimes is not synchronized by id. The second is to finalize the Job block. Their list in the database, have their id, parent record id and the name. The name should be derived from the database. Detailed list works, do not break it ))

3. After the Record button, issue photos with four id to the web: photo id, subtask id, job id and order id.

4. See if everything is fine with geolocation.
                      ''',
                  money: 90,
                ),
              ),
              JobTile(
                job: Job(
                  company: 'Google',
                  title: 'Mobile App UI/UX Recode using Flutter',
                  description:
                      '''I have the back-end , and a fully functional App , but i need to recede exact same client side APP using flutter to run at both IOS and Android .

The winner of this project who will bid a reasonable price , those who bid high price and don't have sample Apps (porkers) will be reported

***You have to re-code the app using Dart/Flutter , and google firebase . no other options will be accepted .****

i will give you the API to our backend to talk with it and to replicate our exact app with the following additional features to be included too

-**App must be done using flutter**

-App must have firebase Auth login,(social,anonymous , sms...)

-App must have good way to take picture (document scanner ,or picture adjustment and manipulation )

-App must have local storage to save requested info and work in offline mode to reduce server calls

-Chat at App must be done using good chat company API ,or using firebase

-App UI must look nice and has nice login animation for buttons and screens using latest flutter techniques etc..

Flutter has 1000's of free examples to use and will take very short time to replicate any app , so i expect you to know exactly what you wanna do using flutter

Please if you can work in flutter this is a long term project and will always pay you extra for updates and enhancements , please bid reasonable price and have your samples ready do not waste our time and your time .
                  ''',
                  money: 300,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  final Job job;

  const JobTile({
    Key key,
    @required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 6.0,
        shadowColor: Colors.black45,
        borderRadius: BorderRadius.circular(4.0),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => JobDetailsPage(job: job),
                ),
              ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  job.company ?? 'Freelance',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  job.title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
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
                              color: Colors.black54,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '7 days',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.black54,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Remote',
                              style: TextStyle(
                                fontSize: 16.0,
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
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
