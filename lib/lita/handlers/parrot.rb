module Lita
  module Handlers
    class Parrot < Handler

      PARROTS = %w[
        :aussiecongaparrot:
        :aussieparrot:
        :bananaparrot:
        :beerparrot:
        :blondesassyparrot:
        :bluescluesparrot:
        :boredparrot:
        :burgerparrot:
        :censoredparrot:
        :chillparrot:
        :coffeeparrot:
        :confusedparrot:
        :congaparrot:
        :crozzyparrot:
        :darkbeerparrot:
        :dealwithitparrot:
        :discoparrot:
        :donutparrot:
        :doubleparrot:
        :dreidelparrot:
        :evilparrot:
        :explodyparrot:
        :fastparrot:
        :fieriparrot:
        :fiestaparrot:
        :gothparrot:
        :halalparrot:
        :harrypotterparrot:
        :icecreamparrot:
        :loveparrot:
        :margaritaparrot:
        :matrixparrot:
        :midparrot:
        :moonwalkparrot:
        :mustacheparrot:
        :nyanparrot:
        :oriolesparrot:
        :papalparrot:
        :parrot:
        :parrot-conga:
        :parrotcop:
        :parrotdad:
        :parrotwave1:
        :parrotwave2:
        :parrotwave3:
        :parrotwave4:
        :parrotwave5:
        :parrotwave6:
        :parrotwave7:
        :partyparrot:
        :popcornparrot:
        :prideparrot:
        :rightparrot:
        :sadparrot:
        :scienceparrot:
        :shipitparrot:
        :shuffleparrot:
        :skiparrot:
        :slowparrot:
        :stableparrot:
        :stalkerparrot:
        :thumbsupparrot:
        :tripleparrot:
        :upvoteparrot:
        :vintageparrot:
        :wendyparrot:
        :xmasparrot:
        :zzzparrot
      ].freeze

      route(/^parrot(\s*|\s+(\S+))$/, :parrot, help: {
        'parrot' => ':parrot-conga-reversed: :parrot-conga:',
        'parrot Amora' => ':parrot-conga-reversed: Amora :parrot-conga:'
      })

      route(
        /^parrots\s+(?<columns>[1-9]\d*)(?:\s+(?<rows>[1-9]\d*))?$/i,
        :call_parrotwall,
        command: true
      )

      def parrot(r)
        r.reply format_parrot(r.matches[0][0])
      end

      def call_parrotwall(r)
        cols = r.match_data['columns'].to_i
        rows = (r.match_data['rows'] || 1).to_i || 1
        rows.times do
          r.reply(Array.new(cols) { PARROTS.sample }.join)
        end
      rescue
        r.reply "No dice"
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
