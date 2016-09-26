;;; Compiled snippets and support files for `json-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'json-mode
                     '(("tpl" "{\n    \"name\": \"$1\",\n    \"description\": \"$2\",\n    \"license\": \"${3:GPL3}\",\n    \"authors\": [\n        {\n            \"name\": \"Jacek Wysocki\",\n            \"email\": \"jacek.wysocki@gmail.com\"\n        }\n    ],\n    \"autoload\": {\n        \"psr-0\": {\"\": \"src/\"}\n    },\n    \"config\": {\n        \"bin-dir\": \"bin\"\n    },\n\n    \"require\": {\n        \"$4\" : \"${5:*}\"\n    },\n\n    \"require-dev\": {\n    }\n}" "Composer template" nil nil nil "/home/exu/.emacs.d/snippets/json-mode/tpl" nil nil)
                       ("sf2" "{\n    \"name\": \"$1\",\n    \"description\": \"$2\",\n    \"autoload\": {\n        \"psr-0\": { \"\": \"src/\", \"Context\": \"features/\", \"spec\": \".\" }\n    },\n    \"require\": {\n        \"php\": \">=5.4.0\",\n        \"symfony/symfony\": \"2.2.*\",\n        \"doctrine/orm\": \"~2.2,>=2.2.3\",\n        \"doctrine/doctrine-bundle\": \"1.2.*\",\n        \"twig/extensions\": \"1.0.*\",\n        \"symfony/assetic-bundle\": \"2.1.*\",\n        \"symfony/swiftmailer-bundle\": \"2.2.*\",\n        \"symfony/monolog-bundle\": \"2.2.*\",\n        \"sensio/distribution-bundle\": \"2.2.*\",\n        \"sensio/framework-extra-bundle\": \"2.2.*\",\n        \"sensio/generator-bundle\": \"2.2.*\",\n        \"jms/security-extra-bundle\": \"1.4.*\",\n        \"jms/di-extra-bundle\": \"1.3.*\",\n\n        \"friendsofsymfony/rest-bundle\": \"dev-master\",\n        \"jms/serializer-bundle\": \"dev-master\"\n    },\n\n    \"require-dev\": {\n        \"behat/behat\": \"2.4.*\",\n        \"behat/symfony2-extension\": \"*\",\n        \"behat/mink-extension\": \"*\",\n        \"behat/mink-browserkit-driver\": \"*\",\n        \"phpspec/phpspec\": \"dev-master\",\n        \"phpspec/php-diff\": \"*@dev\"\n    },\n\n    \"scripts\": {\n        \"post-install-cmd\": [\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::buildBootstrap\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::clearCache\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::installAssets\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::installRequirementsFile\"\n        ],\n        \"post-update-cmd\": [\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::buildBootstrap\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::clearCache\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::installAssets\",\n            \"Sensio\\\\Bundle\\\\DistributionBundle\\\\Composer\\\\ScriptHandler::installRequirementsFile\"\n        ]\n    },\n\n    \"config\": {\n        \"bin-dir\": \"bin\"\n    },\n\n    \"minimum-stability\": \"alpha\",\n    \"extra\": {\n        \"symfony-app-dir\": \"app\",\n        \"symfony-web-dir\": \"web\",\n        \"branch-alias\": {\n            \"dev-master\": \"2.2-dev\"\n        }\n    }\n}" "Sf2 template" nil nil nil "/home/exu/.emacs.d/snippets/json-mode/sf2" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
