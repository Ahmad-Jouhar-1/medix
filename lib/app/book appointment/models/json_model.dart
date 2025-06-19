final myDepartments = [
  {"id": 1, "name": "Cardiology"},
  {"id": 2, "name": "Neurology"},
  {"id": 3, "name": "Pediatrics"},
  {"id": 4, "name": "Dermatology"},
  {"id": 5, "name": "Oncology"},
];

final myDays = {
  1: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": true},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  2: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": true},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  3: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": true},
    {"id": 4, "day": "2025-05-26", "isAvailable": true},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  4: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  5: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
};

final myDoctors = {
  "2025-05-23": {"morning": 1, "afternoon": 2},
  "2025-05-24": {"morning": 3, "afternoon": 4},
  "2025-05-25": {"morning": 5, "afternoon": 6},
  "2025-05-26": {"morning": 7, "afternoon": 8},
  "2025-05-27": {"morning": 9, "afternoon": 10},
};

final myMorningTimes = {
  "2025-05-23": [
    {"id": 1, "time": "2025-05-23T09:00:00Z", "isAvailable": true},
    {"id": 2, "time": "2025-05-23T09:30:00Z", "isAvailable": false},
    {"id": 3, "time": "2025-05-23T10:00:00Z", "isAvailable": true},
    {"id": 4, "time": "2025-05-23T10:30:00Z", "isAvailable": false},
    {"id": 5, "time": "2025-05-23T11:00:00Z", "isAvailable": true},
    {"id": 6, "time": "2025-05-23T11:30:00Z", "isAvailable": false},
    {"id": 7, "time": "2025-05-23T12:00:00Z", "isAvailable": true},
    {"id": 8, "time": "2025-05-23T12:30:00Z", "isAvailable": false},
  ],
  "2025-05-24": [
    {"id": 1, "time": "2025-05-24T09:00:00Z", "isAvailable": false},
    {"id": 2, "time": "2025-05-24T09:30:00Z", "isAvailable": false},
    {"id": 3, "time": "2025-05-24T10:00:00Z", "isAvailable": false},
    {"id": 4, "time": "2025-05-24T10:30:00Z", "isAvailable": false},
    {"id": 5, "time": "2025-05-24T11:00:00Z", "isAvailable": false},
    {"id": 6, "time": "2025-05-24T11:30:00Z", "isAvailable": false},
    {"id": 7, "time": "2025-05-24T12:00:00Z", "isAvailable": true},
    {"id": 8, "time": "2025-05-24T12:30:00Z", "isAvailable": true},
  ],
  "2025-05-25": [
    {"id": 1, "time": "2025-05-25T09:00:00Z", "isAvailable": true},
    {"id": 2, "time": "2025-05-25T09:30:00Z", "isAvailable": true},
    {"id": 3, "time": "2025-05-25T10:00:00Z", "isAvailable": true},
    {"id": 4, "time": "2025-05-25T10:30:00Z", "isAvailable": false},
    {"id": 5, "time": "2025-05-25T11:00:00Z", "isAvailable": false},
    {"id": 6, "time": "2025-05-25T11:30:00Z", "isAvailable": false},
    {"id": 7, "time": "2025-05-25T12:00:00Z", "isAvailable": true},
    {"id": 8, "time": "2025-05-25T12:30:00Z", "isAvailable": true},
  ],
  "2025-05-26": [
    {"id": 1, "time": "2025-05-26T09:00:00Z", "isAvailable": false},
    {"id": 2, "time": "2025-05-26T09:30:00Z", "isAvailable": true},
    {"id": 3, "time": "2025-05-26T10:00:00Z", "isAvailable": false},
    {"id": 4, "time": "2025-05-26T10:30:00Z", "isAvailable": true},
    {"id": 5, "time": "2025-05-26T11:00:00Z", "isAvailable": false},
    {"id": 6, "time": "2025-05-26T11:30:00Z", "isAvailable": false},
    {"id": 7, "time": "2025-05-26T12:00:00Z", "isAvailable": true},
    {"id": 8, "time": "2025-05-26T12:30:00Z", "isAvailable": true},
  ],
  "2025-05-27": [
    {"id": 1, "time": "2025-05-27T09:00:00Z", "isAvailable": true},
    {"id": 2, "time": "2025-05-27T09:30:00Z", "isAvailable": false},
    {"id": 3, "time": "2025-05-27T10:00:00Z", "isAvailable": true},
    {"id": 4, "time": "2025-05-27T10:30:00Z", "isAvailable": true},
    {"id": 5, "time": "2025-05-27T11:00:00Z", "isAvailable": false},
    {"id": 6, "time": "2025-05-27T11:30:00Z", "isAvailable": false},
    {"id": 7, "time": "2025-05-27T12:00:00Z", "isAvailable": true},
    {"id": 8, "time": "2025-05-27T12:30:00Z", "isAvailable": true},
  ],
};

final myAfternoonTimes = {
  "2025-05-23": [
    {"id": 11, "time": "2025-05-23T14:00:00Z", "isAvailable": false},
    {"id": 12, "time": "2025-05-23T14:30:00Z", "isAvailable": false},
    {"id": 13, "time": "2025-05-23T15:00:00Z", "isAvailable": false},
    {"id": 14, "time": "2025-05-23T15:30:00Z", "isAvailable": false},
    {"id": 15, "time": "2025-05-23T16:00:00Z", "isAvailable": false},
    {"id": 16, "time": "2025-05-23T16:30:00Z", "isAvailable": false},
    {"id": 17, "time": "2025-05-23T17:00:00Z", "isAvailable": true},
    {"id": 18, "time": "2025-05-23T17:30:00Z", "isAvailable": true},
  ],
  "2025-05-24": [
    {"id": 11, "time": "2025-05-24T14:00:00Z", "isAvailable": true},
    {"id": 12, "time": "2025-05-24T14:30:00Z", "isAvailable": false},
    {"id": 13, "time": "2025-05-24T15:00:00Z", "isAvailable": true},
    {"id": 14, "time": "2025-05-24T15:30:00Z", "isAvailable": false},
    {"id": 15, "time": "2025-05-24T16:00:00Z", "isAvailable": true},
    {"id": 16, "time": "2025-05-24T16:30:00Z", "isAvailable": false},
    {"id": 17, "time": "2025-05-24T17:00:00Z", "isAvailable": true},
    {"id": 18, "time": "2025-05-24T17:30:00Z", "isAvailable": false},
  ],
  "2025-05-25": [
    {"id": 11, "time": "2025-05-25T14:00:00Z", "isAvailable": false},
    {"id": 12, "time": "2025-05-25T14:30:00Z", "isAvailable": true},
    {"id": 13, "time": "2025-05-25T15:00:00Z", "isAvailable": false},
    {"id": 14, "time": "2025-05-25T15:30:00Z", "isAvailable": true},
    {"id": 15, "time": "2025-05-25T16:00:00Z", "isAvailable": false},
    {"id": 16, "time": "2025-05-25T16:30:00Z", "isAvailable": false},
    {"id": 17, "time": "2025-05-25T17:00:00Z", "isAvailable": true},
    {"id": 18, "time": "2025-05-25T17:30:00Z", "isAvailable": true},
  ],
  "2025-05-26": [
    {"id": 11, "time": "2025-05-26T14:00:00Z", "isAvailable": true},
    {"id": 12, "time": "2025-05-26T14:30:00Z", "isAvailable": true},
    {"id": 13, "time": "2025-05-26T15:00:00Z", "isAvailable": true},
    {"id": 14, "time": "2025-05-26T15:30:00Z", "isAvailable": false},
    {"id": 15, "time": "2025-05-26T16:00:00Z", "isAvailable": false},
    {"id": 16, "time": "2025-05-26T16:30:00Z", "isAvailable": false},
    {"id": 17, "time": "2025-05-26T17:00:00Z", "isAvailable": true},
    {"id": 18, "time": "2025-05-26T17:30:00Z", "isAvailable": true},
  ],
  "2025-05-27": [
    {"id": 11, "time": "2025-05-27T14:00:00Z", "isAvailable": true},
    {"id": 12, "time": "2025-05-27T14:30:00Z", "isAvailable": false},
    {"id": 13, "time": "2025-05-27T15:00:00Z", "isAvailable": true},
    {"id": 14, "time": "2025-05-27T15:30:00Z", "isAvailable": true},
    {"id": 15, "time": "2025-05-27T16:00:00Z", "isAvailable": false},
    {"id": 16, "time": "2025-05-27T16:30:00Z", "isAvailable": false},
    {"id": 17, "time": "2025-05-27T17:00:00Z", "isAvailable": true},
    {"id": 18, "time": "2025-05-27T17:30:00Z", "isAvailable": true},
  ],
};

final myDefaultDays = [
  {"id": 1, "day": "2025-05-23", "isAvailable": false},
  {"id": 2, "day": "2025-05-24", "isAvailable": false},
  {"id": 3, "day": "2025-05-25", "isAvailable": false},
  {"id": 4, "day": "2025-05-26", "isAvailable": false},
  {"id": 5, "day": "2025-05-27", "isAvailable": false},
];

final myDefaultMorningTimes = [
  {"id": 1, "time": "2025-05-23T09:00:00Z", "isAvailable": false},
  {"id": 2, "time": "2025-05-23T09:30:00Z", "isAvailable": false},
  {"id": 3, "time": "2025-05-23T10:00:00Z", "isAvailable": false},
  {"id": 4, "time": "2025-05-23T10:30:00Z", "isAvailable": false},
  {"id": 5, "time": "2025-05-23T11:00:00Z", "isAvailable": false},
  {"id": 6, "time": "2025-05-23T11:30:00Z", "isAvailable": false},
  {"id": 7, "time": "2025-05-23T12:00:00Z", "isAvailable": false},
  {"id": 8, "time": "2025-05-23T12:30:00Z", "isAvailable": false},
];

final myDefaultAfternoonTimes = [
  {"id": 11, "time": "2025-05-23T14:00:00Z", "isAvailable": false},
  {"id": 12, "time": "2025-05-23T14:30:00Z", "isAvailable": false},
  {"id": 13, "time": "2025-05-23T15:00:00Z", "isAvailable": false},
  {"id": 14, "time": "2025-05-23T15:30:00Z", "isAvailable": false},
  {"id": 15, "time": "2025-05-23T16:00:00Z", "isAvailable": false},
  {"id": 16, "time": "2025-05-23T16:30:00Z", "isAvailable": false},
  {"id": 17, "time": "2025-05-23T17:00:00Z", "isAvailable": false},
  {"id": 18, "time": "2025-05-23T17:30:00Z", "isAvailable": false},
];
