m = angular.module 'u', ['ngSanitize']
m.controller 'u_ctrl', ($scope) ->
        $scope.elem_owner_id = 'ignat_insarov'
        $scope.random = [1,2,3]
        $scope.go = () ->
            console.log 'go!'
            VK.Api.call 'wall.get', 'owner_id': $scope.elem_owner_id, (r) ->
                $scope.posts = r.response
                $scope.$apply()
        VK.init 'apiId': 5035099
        $scope.go()


m.directive "contenteditable", () ->
        restrict: "A",
        require: "ngModel",
        link: (scope, element, attrs, ngModel) ->
            read = () ->
                ngModel.$setViewValue element.html()
            ngModel.$render = () ->
                element.html ngModel.$viewValue || ""
            element.bind "blur keyup change", () ->
                scope.$apply read
