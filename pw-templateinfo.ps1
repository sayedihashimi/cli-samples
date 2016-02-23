[cmdletbinding()]
param()

$templateInfo = New-Object -TypeName psobject -Property @{
    Name = 'h5bp'
    Type = 'ProjectTemplate'
    Description = 'html5 boilerplate'

    SourceUri = 'https://github.com/h5bp/html5-boilerplate.git'
    SourceBranch = 'master'
}

# This will register the template with pecan-waffle
Set-TemplateInfo -templateInfo $templateInfo
