m = angular.module 'u', ['ngSanitize']
m.controller 'u_ctrl', ($scope) ->
        $scope.elem_owner_id = 'ignat_insarov'
        $scope.go = () ->
            VK.Api.call 'users.get'
                , 'user_ids':
                    sanitize_oneline $scope.elem_owner_id
                , (r) ->
                    VK.Api.call 'wall.get'
                        , 'owner_id': r.response[0].uid
                        , (r) ->
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

sanitize_oneline = (input) ->
        input . split '<br>', 1
