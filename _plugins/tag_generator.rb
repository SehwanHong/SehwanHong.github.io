module Jekyll
  # 페이지 한 장씩 생성
  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'tag.html')
      # 템플릿에서 사용할 변수
      data['tag']   = tag
      data['title'] = "&#x201C;#{tag}&#x201D; 태그 글"
    end
  end

  # 모든 태그에 대해 TagPage 생성
  class TagGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.tags.keys.each do |tag|
        # 태그 이름을 슬러그화: 공백 → -, 대문자 → 소문자
        slug = tag.to_s.downcase.strip.gsub(' ', '-')
        # tags/<slug>/index.html
        dir  = File.join('tags', slug)
        site.pages << TagPage.new(site, site.source, dir, tag)
      end
    end
  end
end 