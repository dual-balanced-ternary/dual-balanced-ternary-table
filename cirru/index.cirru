
html
  head
    title (= Table)
    meta (:charset utf-8)
    link
      :rel "shortcut icon"
      :href png/5.png
    link
      :rel stylesheet
      :href css/style.css
    script (:src build/build.js) (:defer)
  body
    canvas#canvas