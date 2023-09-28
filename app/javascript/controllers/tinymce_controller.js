import { Controller } from '@hotwired/stimulus'

// Import TinyMCE
import tinymce from 'tinymce/tinymce'
import 'tinymce/models/dom/model'

// Import icons
import 'tinymce/icons/default/icons'

// Import theme
import 'tinymce/themes/silver/theme'

// Import plugins

// import 'tinymce/plugins/advlist'
// import 'tinymce/plugins/anchor'
// import 'tinymce/plugins/autolink'
import 'tinymce/plugins/autoresize'
// import 'tinymce/plugins/autosave'
// import 'tinymce/plugins/charmap'
import 'tinymce/plugins/code'
// import 'tinymce/plugins/codesample'
// import 'tinymce/plugins/directionality'
// import 'tinymce/plugins/emoticons'
import 'tinymce/plugins/help'
// import 'tinymce/plugins/image'
// import 'tinymce/plugins/insertdatetime'
import 'tinymce/plugins/link'
import 'tinymce/plugins/lists'
// import 'tinymce/plugins/media'
// import 'tinymce/plugins/nonbreaking'
// import 'tinymce/plugins/pagebreak'
import 'tinymce/plugins/preview'
// import 'tinymce/plugins/quickbars'
// import 'tinymce/plugins/save'
// import 'tinymce/plugins/searchreplace'
import 'tinymce/plugins/table'
// import 'tinymce/plugins/template'
// import 'tinymce/plugins/visualblocks'
// import 'tinymce/plugins/visualchars'
import 'tinymce/plugins/wordcount'

export default class extends Controller {
  static targets = ['input']

  initialize () {
    this.defaults = {
      selector: 'textarea',
      plugins: 'ai tinycomments mentions anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed permanentpen footnotes advtemplate advtable advcode editimage tableofcontents mergetags powerpaste tinymcespellchecker autocorrect a11ychecker typography inlinecss',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | align lineheight | tinycomments | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
      mergetags_list: [
        { value: 'First.Name', title: 'First Name' },
        { value: 'Email', title: 'Email' },
      ],
      ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant"))
    }
  }

  connect () {
    // Initialize TinyMCE
      let config = Object.assign({ target: this.inputTarget }, this.defaults)
      tinymce.init(config)
  }
}
