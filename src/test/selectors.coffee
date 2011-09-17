assert = require('assert')
vows = require('vows')
sel = require('sel')

selectors = {
    'body': 1,
    'body div': 51,
    'div': 51,
    'div p': 140,
    'div > p': 134,
    'div + p': 22,
    'div ~ p': 183,
    'div p a': 12,
    'div, p, a': 671,
    '.note': 14,
    'div.example': 43,
    'div.example, div.note': 44,
    'div #title': 1,
    'h1#title': 1,
    'h1#title + div > p': 0,
    '#title': 1,
    'ul .tocline2': 12,
    'ul.toc > li.tocline2': 12,
    'ul.toc li.tocline2': 12,
    'a[href][lang][class]': 1,
    'div[class!=made_up]': 51,
    'div[class$=mple]': 43,
    'div[class*=e]': 50,
    'div[class=example]': 43,
    'div[class]': 51,
    'div[class^=exa]': 43,
    'div[class^=exa][class$=mple]': 43,
    'div[class|=dialog]': 0,
    'div[class~=example]': 43,
    'div:not(.example)': 8,
    'h1[id]:contains(Selectors)': 1,
    'p:contains(selectors)': 54,
    'p:first-child': 54,
    'p:last-child': 19,
    'p:nth-child(2n)': 158,
    'p:nth-child(2n+1)': 166,
    'p:nth-child(even)': 158,
    'p:nth-child(n)': 324,
    'p:nth-child(odd)': 166,
    'p:only-child': 3,
}

tests = {}
for s, num of selectors
    do (s, num) ->
        tests[s] = ($, root) -> assert.equal $(s, root).length, num

vows.add 'Slickspeed Selectors',

    'sel:': 
        topic: () ->
            el = document.createElement('iframe')
            el.src = 'template.html'
            el.style.width = 0
            el.style.height = 0
            el.style.display = 'none'
            el.style.visibility = 'hidden'
            el.onload = () =>
                @success(sel.sel, el.contentDocument)
            
            document.body.appendChild(el)
            return
            
        '':  tests