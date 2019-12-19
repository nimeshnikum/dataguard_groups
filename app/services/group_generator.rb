class GroupGenerator
  attr_reader :event, :group_mapping, :group_count
  GROUP_THRESHOLD = 7

  def initialize(event)
    @event = event
    @group_count = (@event.event_attendees.count / GROUP_THRESHOLD) + 1
    @group_mapping = Hash[ (0..group_count-1).collect { |i| [i, []] } ]
  end

  def generate!
    assign_attendees_to_groups
    create_groups_and_set_leader
  end

  private

  def attendees_by_department
    @event.event_attendees.group_by { |ea| ea.employee.department_id }
  end

  def assign_attendees_to_groups
    last_assignment_index = 0
    attendees_by_department.each do |department, attendees|
      attendees.each_with_index do |attendee, i|
        group_num = (i + last_assignment_index) % group_count
        group_mapping[group_num] << attendee
      end
      last_assignment_index = (last_assignment_index + attendees.length) % group_count
    end
  end

  def create_groups_and_set_leader
    group_mapping.each do |g, attendees|
      group = @event.event_groups.create(name: "Group #{g+1}", event_attendees: attendees)
      # set leader
      group.event_group_members.each do |m|
        unless m.event_attendee.employee.leader_history?
          m.update_attributes(is_leader: true)
          break
        end
      end
    end
  end
end
