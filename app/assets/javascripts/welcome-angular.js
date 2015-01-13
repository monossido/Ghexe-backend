angular.module('welcomeGhexe', ['ngMaterial', 'ngCookies'])
.controller('LoginController', function ($scope, $rootScope, AUTH_EVENTS, AuthService, $cookieStore, Session) {
  $scope.credentials = {
    email: '',
    password: '',
    grant_type: 'password',
    scope: 'user'
  };
  $scope.login = function (credentials) {
    AuthService.login(credentials).then(function (user) {
      $rootScope.$broadcast(AUTH_EVENTS.loginSuccess);
      $cookieStore.put('loggedin', 'true');
      $cookieStore.put('user', user);
      $cookieStore.put('access_token', Session.access_token);
      $scope.setCurrentUser(user);
    }, function () {
      $rootScope.$broadcast(AUTH_EVENTS.loginFailed);
    });
  };
})
.constant('AUTH_EVENTS', {
  loginSuccess: 'auth-login-success',
  loginFailed: 'auth-login-failed',
  logoutSuccess: 'auth-logout-success',
  sessionTimeout: 'auth-session-timeout',
  notAuthenticated: 'auth-not-authenticated',
  notAuthorized: 'auth-not-authorized'
})
.factory('AuthService', function ($http, Session) {
  var authService = {};

  authService.login = function (credentials) {
    return $http
    .post('/oauth/token', credentials)
    .then(function (res) {
      Session.create(res.data.access_token);
        return $http.get('/api/me.json?access_token=' + res.data.access_token)
        .then(function (res) {
          return res.data;
        });
      });
    };

    return authService;
})
.service('Session', function () {
  this.create = function (access_token) {
    this.access_token = access_token;
  };
  this.destroy = function () {
    this.access_token = null;
  };
  return this;
})
.controller('ApplicationController', function ($http, $scope, $filter, $cookieStore, Session, AuthService) {
  $scope.getEvents = function() {
    $http.get("/api/events.json?access_token=" + Session.access_token)
    .success(function (res) {
      angular.copy(res.events, o.events);
    })
    .error(function(data, status, headers, config) {
      $scope.logout();
    });
  }

  $scope.setCurrentUser = function (user) {
    $scope.currentUser = user;

    $scope.getEvents();
  };

  $scope.logout = function() {
    $scope.currentUser = null;
    Session.destroy();
    $cookieStore.remove('access_token');
    $cookieStore.remove('user');
  }

  $scope.updatePresence = function(id, presence) {
    console.log("body="+presence)
    $http.put("/api/presences/" + id + "?access_token=" + Session.access_token
    , JSON.stringify({'presence': {'presence' : presence}}))
    .success(function (res) {
    })
    .error(function(data, status, headers, config) {
    });
  }

  $scope.loggedIn = $cookieStore.get('loggedin');
  if ($scope.loggedIn == "true") {
    Session.create($cookieStore.get('access_token'));
    $scope.setCurrentUser($cookieStore.get('user'));
  } else {
    $scope.logout();
  }

  var o = {
    events: []
  };
  $scope.o = o;
  $scope.date = new Date();

  function getDay() {
    var dayOfWeek = $scope.date.getDay();
    if(dayOfWeek == 0)
      dayOfWeek = 6;
    else
      dayOfWeek--;

    return dayOfWeek;
  }

  var tabs = [
    { title: 'Lunedì', content: "o.events[0].title="},
    { title: 'Martedì', content: "You can swipe left and right on a mobile device to change tabs."},
    { title: 'Mercoledì', content: "You can bind the selected tab via the selected attribute on the md-tabs element."},
    { title: 'Giovedì', content: "If you set the selected tab binding to -1, it will leave no tab selected."},
    { title: 'Venerdì', content: "If you remove a tab, it will try to select a new one."},
    { title: 'Sabato', content: "There's an ink bar that follows the selected tab, you can turn it off if you want."},
    { title: 'Domenica', content: "If you set ng-disabled on a tab, it becomes unselectable. If the currently selected tab becomes disabled, it will try to select the next tab."},
  ];
  $scope.tabs = tabs;
  $scope.selectedIndex = getDay();
  $scope.announceSelected = announceSelected;
  $scope.announceDeselected = announceDeselected;

  function announceDeselected(tab) {
    $scope.farewell = 'Goodbye ' + tab.title + '!';
  }
  function announceSelected(tab) {
    $scope.greeting = 'Hello ' + tab.title + '!';
  }
});
