/*import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final listOfTasksStateProvider = StateProvider<List<String>>((ref) {
  return [];
});

class TasksScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  void clearText() {
    titleController.clear();
    timeController.clear();
    dateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) =>
        Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Tasks'),
          ),
          body: ConditionalBuilder(
            condition: watch(listOfTasksStateProvider).isNotEmpty,
            builder: (context) => ListView.builder(
              itemCount: watch(listOfTasksStateProvider).length,
              itemBuilder: (context, index) => Text(watch(listOfTasksStateProvider)[index]),
            ),
            fallback: (context) => Center(
              child: Text('No tasks found'),
            ),
          ),
        ),
    );
  }
}*/

/*
* floatingActionButton: FloatingActionButton(
            onPressed: ()
    {
      if ( //cubit.isBottom) {
      if (formKey.currentState!.validate ()
    ) {
    cubit.insertDatabase(
    title: titleController.text,
    time: timeController.text,
    date: dateController.text,
    );

    }
    clearText();
    } else {
    scaffoldKey.currentState!
        .showBottomSheet(
    (context) => Container(
    color: Colors.grey[100],
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Form(
    key: formKey,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    defaultTextFormField(
    text: 'Task Title',
    prefix: Icons.title,
    textInputType: TextInputType.text,
    controller: titleController,
    validate: (value) {
    if (value.isEmpty) {
    return 'title musn\'t be empty';
    }
    return null;
    }),
    const SizedBox(
    height: 15.0,
    ),
    defaultTextFormField(
    onTap: () {
    showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    ).then((value) {
    timeController.text =
    value!.format(context).toString();
    });
    },
    text: 'Task Time',
    prefix: Icons.watch_later_outlined,
    textInputType: TextInputType.datetime,
    controller: timeController,
    validate: (value) {
    if (value.isEmpty) {
    return 'time musn\'t be empty';
    }
    return null;
    }),
    const SizedBox(
    height: 15.0,
    ),
    defaultTextFormField(
    onTap: () {
    showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
    const Duration(
    days: 100,
    ),
    ),
    ).then((value) {
    //dateController.text =
    //  DateFormat.yMMMd().format(value!);
    });
    },
    text: 'Task Date',
    prefix: Icons.date_range_outlined,
    textInputType: TextInputType.datetime,
    controller: dateController,
    validate: (value) {
    if (value.isEmpty) {
    return 'date mun\'t be empty';
    }
    return null;
    }),
    ],
    ),
    ),
    ),
    ),
    )
        .closed
        .then((value) {
    cubit.changeBottomSheetState(
    isOpened: false,
    icon: Icons.edit,
    );

    });
    cubit.changeBottomSheetState(
    isOpened: true,
    icon: Icons.add,
    );

    }
  }

  ,

  child

      :

  Icon

  (

  //cubit.fabIcon,
  Icons

      .

  add

  )

  ,

  )

  ,*/