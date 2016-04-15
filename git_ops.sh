#!/bin/zsh
echo "add tag ${tagname}"


add_tag() {
    tagname=$1
    git tag -a -m "${tagname}" "${tagname}"

    if ! [ $? -eq 0 ]; then
        echo "exist"
        git tag -d "${tagname}"
        if [ $? -eq 0 ]; then
            git tag -a -m "${tagname}" "${tagname}"
            if [ $? -eq 0 ];then
                echo "push to origin ${tagname}"
                git push origin :"${tagname}"
                git push origin "${tagname}"
            fi
        fi
    else
        echo "push to origin ${tagname}"
        git push origin ${tagname}
    fi
}

add_tag $@
