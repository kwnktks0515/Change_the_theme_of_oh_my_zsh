export ZSH=/Users/kawanakatakashi/.oh-my-zsh

# Add Script 
# Random Themes
# All themes
# array=('3den' 'Soliah' 'adben' 'af-magic' 'afowler' 'agnoster' 'alanpeabody' 'amuse' 'apple' 'arrow' 'aussiegeek' 'avit' 'awesomepanda' 'bira' 'blinks' 'bureau' 'candy-kingdom' 'candy' 'clean' 'cloud' 'crcandy' 'crunch' 'cypher' 'dallas' 'darkblood' 'daveverwer' 'dieter' 'dogenpunk' 'dpoggi' 'dst' 'dstufft' 'duellj' 'eastwood' 'edvardm' 'emotty' 'essembeh' 'evan' 'example' 'fino-time' 'fino' 'fishy' 'flazz' 'fletcherm' 'fox' 'frisk' 'frontcube' 'funky' 'fwalch' 'gallifrey' 'gallois' 'garyblessington' 'gentoo' 'geoffgarside' 'gianu' 'gnzh' 'gozilla' 'half-life' 'humza' 'imajes' 'intheloop' 'itchy' 'jaischeema' 'jbergantine' 'jispwoso' 'jnrowe' 'jonathan' 'josh' 'jreese' 'jtriley' 'juanghurtado' 'junkfood' 'kafeitu' 'kardan' 'kennethreitz' 'kiwi' 'kolo' 'kphoen' 'lambda' 'linuxonly' 'lukerandall' 'macovsky-ruby' 'macovsky' 'maran' 'mgutz' 'mh' 'michelebologna' 'mikeh' 'miloshadzic' 'minimal' 'mira' 'mortalscumbag' 'mrtazz' 'murilasso' 'muse' 'nanotech' 'nebirhos' 'nicoulaj' 'norm' 'obraun' 'peepcode' 'philips' 'pmcgee' 'pure' 'pygmalion' 're5et' 'rgm' 'risto' 'rixius' 'rkj-repos' 'rkj' 'robbyrussell' 'sammy' 'simonoff' 'simple' 'skaro' 'smt' 'sonicradish' 'sorin' 'sporty_256' 'steeef' 'strug' 'sunaku' 'sunrise' 'superjarin' 'suvash' 'takashiyoshida' 'terminalparty' 'theunraveler' 'tjkirch' 'tjkirch_mod' 'tonotdo' 'trapd00r' 'wedisagree' 'wezm+' 'wezm' 'wuffers' 'xiong-chiamiov-plus' 'xiong-chiamiov' 'ys' 'zhann')

array=('Soliah' 'af-magic' 'afowler' 'alanpeabody' 'amuse' 'apple' 'arrow' 'aussiegeek' 'avit' 'awesomepanda' 'bira' 'blinks' 'bureau' 'candy' 'clean' 'cloud' 'crcandy' 'crunch' 'cypher' 'dallas' 'darkblood' 'daveverwer' 'dieter' 'dogenpunk' 'dpoggi' 'dst' 'dstufft' 'duellj' 'eastwood' 'edvardm' 'emotty' 'essembeh' 'evan' 'example' 'fino' 'fishy' 'flazz' 'fletcherm' 'fox' 'frisk' 'funky' 'fwalch' 'gallifrey' 'gallois' 'garyblessington' 'gentoo' 'geoffgarside' 'gianu' 'gnzh' 'gozilla' 'half-life' 'humza' 'imajes' 'intheloop' 'jaischeema' 'jbergantine' 'jispwoso' 'jnrowe' 'jonathan' 'josh' 'jreese' 'jtriley' 'juanghurtado' 'junkfood' 'kafeitu' 'kardan' 'kennethreitz' 'kiwi' 'kolo' 'kphoen' 'lambda' 'linuxonly' 'lukerandall' 'macovsky-ruby' 'macovsky' 'maran' 'mgutz' 'mh' 'michelebologna' 'mikeh' 'miloshadzic' 'minimal' 'mira' 'mortalscumbag' 'mrtazz' 'murilasso' 'muse' 'nanotech' 'nebirhos' 'nicoulaj' 'norm' 'obraun' 'peepcode' 'philips' 'pmcgee' 'pure' 'pygmalion' 're5et' 'rgm' 'risto' 'rixius' 'rkj-repos' 'rkj' 'robbyrussell' 'sammy' 'simonoff' 'simple' 'skaro' 'smt' 'sonicradish' 'sorin' 'sporty_256' 'steeef' 'strug' 'sunaku' 'sunrise' 'superjarin' 'suvash' 'takashiyoshida' 'terminalparty' 'theunraveler' 'tjkirch' 'tjkirch_mod' 'tonotdo' 'trapd00r' 'wedisagree' 'wezm+' 'wezm' 'wuffers' 'xiong-chiamiov-plus' 'xiong-chiamiov' 'ys' 'zhann')
exclusion=('3den' 'frontcube' 'adben' 'fino-time' 'candy-kingdom' 'itchy' 'agnoster')

#Show all theme
function themes_all() {
  for filepath in `cd /Users/kawanakatakashi/.oh-my-zsh/themes/ && ls`
  do
    echo -n "'${filepath%%.*}' "
  done
}
#Show sorted theme 
function themes_init() {
  for filepath in `cd /Users/kawanakatakashi/.oh-my-zsh/themes/ && ls`
    do
    for name in ${exclusion[@]}
    do
      if [ ${name} = ${filepath%%.*} ]; then
        continue 2
      fi
    done
    echo -n "'${filepath%%.*}' "
  done
}

#Search all themes 
function themes_split() { 
  array=()
  for filepath in `cd /Users/kawanakatakashi/.oh-my-zsh/themes/ && ls`
  do
    array+=(${filepath%%.*})
  done
  while :
  do
    rand=$((RANDOM % ${#array[@]}))
    for name in ${exclusion[@]}
    do
      if [ ${name} = ${array[${rand}]} ]; then
        continue 2
      fi
    done
    echo ${array[${rand}]}
    break
  done  
}

function themes_split2() {
  echo ${array[${$((RANDOM % ${#array[@]}))}]}
}

echo `themes_split`
ZSH_THEME=`themes_split`
#End

plugins=(git)
source $ZSH/oh-my-zsh.sh