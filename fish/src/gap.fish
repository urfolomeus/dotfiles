function gap
    # if no commit message is provided, error out
    if test -z $argv
        echo "Please provide a commit message"
        return 1
    end

    # git add, commit with given message and push
    command git add . && git commit -m $argv && git push -u
end
