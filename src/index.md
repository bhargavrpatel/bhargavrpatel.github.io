---
layout: base
---

<style type="text/css">
  section ul {
    list-style: square;
    padding-left: 20px;
  }

  section ul li {
    margin-bottom: 0.5em;
  }

  @media screen and (max-width: 568px) {
    /* Hide bullets on mobile */
    section ul {
      list-style: none;
      padding-left: 0;
    }
  }
</style>

<main>
    <div class="logo unit whole">
        <h3>Posts</h3>
        <ul>
            <li>
                {%- for post in collections.post -%}
                    <span class="published-date hide-on-mobiles">{{ post.date | formatDate }} —</span>
                    <a href="{{ post.url }}">{{ post.data.title }}</a>
                {%- endfor -%}
            </li>
        </ul>
    </div>
</main>
