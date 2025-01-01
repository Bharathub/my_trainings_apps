import 'package:flutter/material.dart';
import 'package:my_trainings_app/models/model.dart';

enum SortBy { location, trainingName, trainer }

class BottomSheetWidget extends StatefulWidget {
  final ValueChanged<TrainingSession> onChangeFilterData;
  final TrainingSession? selectedSessionData;
  const BottomSheetWidget(
      {super.key, required this.onChangeFilterData, this.selectedSessionData});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TrainingSession? selectedSession;
  String? selectedLocation;
  String? selectedTrainer;
  String? selectedTrainingName;
  List<String> locationName = [];
  List<String> trainingName = [];
  List<String> trainer = [];
  SortBy? selectedSortBy;
  List<TrainingSession>? filteredSessions;

  void _filterSessions(String query) {
    setState(() {
      filteredSessions = sessions.where((session) {
        return (selectedLocation != null &&
                session.location.contains(selectedLocation!)) ||
            (selectedTrainer != null &&
                session.trainer.contains(selectedTrainer!)) ||
            (selectedTrainingName != null &&
                session.trainingName.contains(selectedTrainingName!));
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    locationName = sessions.map((e) => e.location).toList();
    trainer = sessions.map((e) => e.trainer).toList();
    trainingName = sessions.map((e) => e.trainingName).toList();

    selectedLocation = widget.selectedSessionData?.location;
    selectedTrainingName = widget.selectedSessionData?.trainingName;
    selectedTrainer = widget.selectedSessionData?.trainer;

    selectedSortBy = SortBy.location;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sort and Filters',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black12,
                      ),
                      child: const Center(
                        child: Text(
                          "Sort by",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search ...",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (query) {
                            _filterSessions(query);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SelectionContainer(
                          label: "Location",
                          isSelected: selectedSortBy == SortBy.location,
                          onChanged: () {
                            setState(() {
                              selectedSortBy = SortBy.location;
                            });
                          },
                        ),
                        SelectionContainer(
                          label: "Training\nName",
                          isSelected: selectedSortBy == SortBy.trainingName,
                          onChanged: () {
                            setState(() {
                              selectedSortBy = SortBy.trainingName;
                            });
                          },
                        ),
                        SelectionContainer(
                          label: "Trainer",
                          isSelected: selectedSortBy == SortBy.trainer,
                          onChanged: () {
                            setState(() {
                              selectedSortBy = SortBy.trainer;
                            });
                          },
                        ),
                      ],
                    ),
                    if (selectedSortBy == SortBy.location)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: locationName.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              title: Text(locationName[index]),
                              value: selectedLocation == locationName[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedLocation = value ?? false
                                      ? locationName[index]
                                      : null;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    if (selectedSortBy == SortBy.trainingName)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: trainingName.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              title: Text(trainingName[index]),
                              value:
                                  selectedTrainingName == trainingName[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedTrainingName = value ?? false
                                      ? trainingName[index]
                                      : null;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    if (selectedSortBy == SortBy.trainer)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: trainer.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              title: Text(trainer[index]),
                              value: selectedTrainer == trainer[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedTrainer =
                                      value ?? false ? trainer[index] : null;
                                });
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    if (selectedLocation != null ||
                        selectedTrainer != null ||
                        selectedTrainingName != null) {
                      widget.onChangeFilterData(
                        TrainingSession(
                          trainingName: selectedTrainingName ?? "",
                          trainer: selectedTrainer ?? "",
                          location: selectedLocation ?? "",
                          locationShortDist: "",
                        ),
                      );

                      Navigator.pop(context);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              alignment: Alignment.center,
                              title: const Text(
                                textAlign: TextAlign.center,
                                'Please select filled',
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                FilledButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Ok",
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Text("Select",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onChanged;

  const SelectionContainer({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black12,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white10,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(width: 22),
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
