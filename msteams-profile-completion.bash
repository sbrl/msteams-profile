#!/usr/bin/env bash

__msteams-profile-completions() {
	# echo "words: ${#COMP_WORDS[@]} / ${COMP_WORDS[*]} / 1 = ${COMP_WORDS[1]}, 2 = ${COMP_WORDS[2]}, 3 = ${COMP_WORDS[3]}";
	if [[ "${#COMP_WORDS[@]}" == 2 ]]; then
		COMPREPLY=($(compgen -W "show list switch" "${COMP_WORDS[1]}"));
	else
		if [[ "${COMP_WORDS[1]}" == "switch" ]]; then
			COMPREPLY=($(compgen -W "$(ls -1 "${HOME}/.config/Microsoft/__custom_msteams_profiles")" "${COMP_WORDS[2]}"));
		fi
	fi
}

complete -F __msteams-profile-completions msteams-profile;
