module Lita
  module Handlers
    class Parrot < Handler
      route(/^parrot(\s*|\s+(\S+))$/, :parrot, help: {
        'parrot' => ':parrot-conga-reversed: :parrot-conga:',
        'parrot Amora' => ':parrot-conga-reversed: Amora :parrot-conga:'
      })

      def parrot(r)
        r.reply format_parrot(r.matches[0][0])
      end

      private

      def format_parrot(match)
        if match.length == 0
          ':parrot-conga-reversed: :mini-jeremie: :parrot-conga:'
        else
          str = ':parrot-conga-reversed: :parrot-conga: :parrot: '
          str+= match.gsub(/\s/, '')
          str+= ' :parrot: :parrot-conga-reversed: :parrot-conga:'
          str
        end
      end
    end

    Lita.register_handler(Parrot)
  end
end
